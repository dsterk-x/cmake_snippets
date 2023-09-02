# ---------------------------------------------------------
# Basic Project Setup
# ---------------------------------------------------------
cmake_minimum_required(VERSION 3.24)
project(delta_tests LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "lib")

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/tools/cmake)

include(small_world_test_wrapper)

enable_testing()
# ---------------------------------------------------------
# Snippet
# ---------------------------------------------------------
add_subdirectory(src)
