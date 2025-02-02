cmake_minimum_required(VERSION 3.30)

project(chip-design)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# set(CMAKE_CXX_FLAGS -fcoroutines)

find_package(verilator HINTS)
if(NOT verilator_FOUND)
    message(
        FATAL_ERROR
        "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable"
    )
endif()

 set(TEST_NAMES 
     ALUTest
#     AdderTest
#     MultiplierTest
#     RCATest
#     ShifterTest
     register_file
 )

foreach(TEST_NAME ${TEST_NAMES})
add_executable( ${TEST_NAME} tests/${TEST_NAME}.cpp)

    verilate(${TEST_NAME}
    SOURCES
        ./tests/${TEST_NAME}.sv
    INCLUDE_DIRS
        ./src
        ./src/Segmented_Adders
        ./src/Segmented_Multipliers
        ./src/Common_Modules
        ./src/core/RegisterFile/
        ./src/components/
    VERILATOR_ARGS --timing --assert --trace
)
endforeach()
