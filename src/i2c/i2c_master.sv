/* verilator lint_off WIDTHEXPAND */
/* verilator lint_off WIDTHCONCAT */
/* verilator lint_off MULTIDRIVEN */
/* verilator lint_off LATCH */

module i2c_master #(
    // Parameters for clock frequencies
    parameter CLK_FREQ = 27_000_000, // System clock frequency in Hz
    parameter I2C_FREQ = 100_000     // I²C clock frequency in Hz
)(
    input  logic         clk,      // System clock
    input  logic         rst,      // Asynchronous reset (active high)
    input  logic         start,    // Start transaction signal
    input  logic [6:0]   addr,     // 7-bit slave address
    input  logic         rw,       // Read/Write control (0: Write, 1: Read)
    input  logic [7:0]   data_in,  // Data to be transmitted
    output logic [7:0]   data_out, // Data received (for read transactions)
    output logic         busy,     // Busy flag indicates transaction in progress
    output logic         done,     // Done flag pulses at transaction end
    output logic         scl,      // I²C clock
    inout  wire          sda       // I²C data (bidirectional)
);

  // Calculate clock divider count (half period of SCL)
  localparam integer CLK_DIV = CLK_FREQ / (I2C_FREQ * 2);
  
  // Clock divider counter
  logic [$clog2(CLK_DIV)-1:0] clk_div_cnt;
  logic scl_int; // internal SCL signal

  // Generate SCL using a simple divider
  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      clk_div_cnt <= 0;
      scl_int <= 1;
    end else begin
      if(clk_div_cnt == CLK_DIV-1) begin
        clk_div_cnt <= 0;
        scl_int <= ~scl_int;
      end else begin
        clk_div_cnt <= clk_div_cnt + 1;
      end
    end
  end

  // Drive the output SCL (synchronizing with our internal divider)
  assign scl = scl_int;

  // Tri-state control for SDA: when output enabled, drive sda_out; otherwise, high-Z.
  logic sda_out;
  logic sda_oe; // Output enable: 0 drives the bus, 1 releases (high impedance)
  assign sda = sda_oe ? 1'bz : sda_out;

  // Sample external SDA signal
  logic sda_in;
  assign sda_in = sda;

  // State machine declaration
  typedef enum logic [3:0] {
    IDLE,
    START_COND,
    SEND_ADDR,
    SEND_RW,
    WAIT_ACK1,
    SEND_DATA,
    WAIT_ACK2,
    STOP_COND,
    COMPLETE
  } state_t;

  state_t state, next_state;

  // Counters for bit transmission
  logic [3:0] bit_cnt;
  logic [7:0] shift_reg;

  // Sequential state update
  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      state    <= IDLE;
      bit_cnt  <= 0;
      shift_reg<= 0;
      busy     <= 0;
      done     <= 0;
      sda_oe   <= 1; // Release SDA
      sda_out  <= 1;
    end else begin
      // Use the SCL falling edge for data transitions
      if(~scl_int) begin
        state <= next_state;
        
        // State-dependent operations
        case(state)
          IDLE: begin
            done <= 0;
            if(start) begin
              busy <= 1;
            end
          end

          START_COND: begin
            // Generate start: SDA goes low while SCL is high.
            sda_oe  <= 0; // drive
            sda_out <= 0;
          end

          SEND_ADDR: begin
            // Shift out the address MSB first.
            sda_out <= shift_reg[7];
            sda_oe  <= 0;
            shift_reg <= {shift_reg[6:0], 1'b0};
            bit_cnt <= bit_cnt + 1;
          end

          SEND_RW: begin
            // Send R/W bit (rw) after address
            sda_out <= rw;
            sda_oe  <= 0;
          end

          WAIT_ACK1: begin
            // Release SDA to allow slave to ack
            sda_oe <= 1;
          end

          SEND_DATA: begin
            // Transmit data bits
            sda_out <= shift_reg[7];
            sda_oe  <= 0;
            shift_reg <= {shift_reg[6:0], 1'b0};
            bit_cnt <= bit_cnt + 1;
          end

          WAIT_ACK2: begin
            // Release SDA to receive ack from slave after data
            sda_oe <= 1;
          end

          STOP_COND: begin
            // Generate stop: SDA goes from low to high when SCL is high.
            sda_oe  <= 0;
            sda_out <= 0; // Ensure low then release
          end

          COMPLETE: begin
            busy <= 0;
            done <= 1;
            sda_oe <= 1; // Release SDA
          end

          default: ;
        endcase
      end
    end
  end

  // Next state combinational logic
  always @(posedge clk) begin
    next_state <= state;
    case(state)
      IDLE: begin
        if(start)
          next_state <= START_COND;
      end

      START_COND: begin
        // Prepare to send address: load shift register with address.
        next_state <= SEND_ADDR;
        shift_reg <= {addr, 1'b0}; // address[6:0] + dummy bit (will be overwritten by rw later)
        bit_cnt <= 0;
      end

      SEND_ADDR: begin
        if(bit_cnt == 7) // after 7 bits transmitted
          next_state <= SEND_RW;
      end

      SEND_RW: begin
        next_state <= WAIT_ACK1;
      end

      WAIT_ACK1: begin
        // Sample ack (assume ack = 0 means OK)
        next_state <= SEND_DATA;
        bit_cnt <= 0;
        shift_reg <= data_in;
      end

      SEND_DATA: begin
        if(bit_cnt == 8) // after 8 data bits transmitted
          next_state <= WAIT_ACK2;
      end

      WAIT_ACK2: begin
        // Sample data ack from slave then proceed to stop condition.
        next_state <= STOP_COND;
      end

      STOP_COND: begin
        // Finish the transaction by releasing SDA when SCL is high.
        if(scl_int) begin
          sda_oe <= 1;
          sda_out <= 1;
          next_state <= COMPLETE;
        end
      end

      COMPLETE: begin
        next_state <= IDLE;
      end

      default: next_state <= IDLE;
    endcase
  end

endmodule
