# ---------------------------------------------------------
# Basic Project Setup
# ---------------------------------------------------------
cmake_minimum_required(VERSION 3.24)
project(verify_header LANGUAGES C)

enable_testing()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)
set(CMAKE_VERIFY_INTERFACE_HEADER_SETS ON)

include(GNUInstallDirs)

# ---------------------------------------------------------
# Snippet
# ---------------------------------------------------------
add_subdirectory(src)

install(EXPORT export_all DESTINATION ${CMAKE_BINARY_DIR}/install/cmake
  NAMESPACE small_world::
  FILE SmallWorldConfig.cmake
)


# ---------------------------------------------------------
# Tests
# ---------------------------------------------------------
add_test(
  NAME verify_interface_header_sets
  COMMAND ${CMAKE_COMMAND}
    --build ${CMAKE_CURRENT_BINARY_DIR}
    --target=all_verify_interface_header_sets
)

add_test(
  NAME install_package
  COMMAND ${CMAKE_COMMAND}
    --install ${CMAKE_CURRENT_BINARY_DIR}
)

add_test(
  NAME consume_cmake_package
  COMMAND ${CMAKE_CTEST_COMMAND}
    --build-and-test
      ${CMAKE_CURRENT_LIST_DIR}/test_cmake_package
      ${CMAKE_BINARY_DIR}/test_cmake_package
    --build-generator "Unix Makefiles" -j 8
    --build-options
      "-DSmallWorld_ROOT:PATH=${CMAKE_BINARY_DIR}/install"
)
set_tests_properties(consume_cmake_package PROPERTIES DEPENDS "install_package")
