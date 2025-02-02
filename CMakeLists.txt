cmake_minimum_required(VERSION 3.30)

project(chip-design)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(verilator HINTS)
if(NOT verilator_FOUND)
    message(
        FATAL_ERROR
        "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable"
    )
endif()

set(TEST_NAMES
    ALUTest
    Decoder_tb
    RegisterFile_tb
    register_file
    # ...
)

foreach(TEST_NAME ${TEST_NAMES})
add_executable( ${TEST_NAME} test/${TEST_NAME}.cpp)

    verilate(${TEST_NAME}
    SOURCES
        ./test/${TEST_NAME}.sv
    INCLUDE_DIRS
        ./src
        ./src/components
        ./src/core
        ./src/memory
        ./src/uart
    VERILATOR_ARGS --timing --assert --trace
)
endforeach()
