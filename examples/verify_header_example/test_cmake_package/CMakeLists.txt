# ---------------------------------------------------------
# Basic Project Setup
# ---------------------------------------------------------
cmake_minimum_required(VERSION 3.24)
project(test_package_integration LANGUAGES C)

enable_testing()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# ---------------------------------------------------------
# Snippet
# ---------------------------------------------------------
find_package(SmallWorld REQUIRED CONFIG)

set(TARGET_NAME test_package_integration)

add_executable(
  ${TARGET_NAME}
  src/main.c
)

target_link_libraries(
  ${TARGET_NAME}
  small_world::alice
  small_world::bob
)
