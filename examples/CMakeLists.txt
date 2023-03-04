cmake_minimum_required(VERSION 3.25)

# ---------------------------------------------------------
# Build all sub-snippets
# ---------------------------------------------------------

add_test(
  NAME verify_header_example
  COMMAND ${CMAKE_CTEST_COMMAND}
    --build-and-test
      ${CMAKE_CURRENT_LIST_DIR}/verify_header_example
      ${CMAKE_CURRENT_LIST_DIR}/verify_header_example/build
    --build-generator "Unix Makefiles" -j 8
    --test-command ${CMAKE_CTEST_COMMAND}
      ./verify_header_example/build -VV -- -j 8
)
