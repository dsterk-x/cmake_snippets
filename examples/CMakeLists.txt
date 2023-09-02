cmake_minimum_required(VERSION 3.25)

# ---------------------------------------------------------
# Build all sub-snippets
# ---------------------------------------------------------

# verify header example
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

# cycle check
add_test(
  NAME cycle_check
  COMMAND ${CMAKE_CTEST_COMMAND}
    --build-and-test
      ${CMAKE_CURRENT_LIST_DIR}/cycle_depdendency_check
      ${CMAKE_CURRENT_LIST_DIR}/cycle_depdendency_check/build
    --build-generator "Unix Makefiles" -j 8
)
# Test will fail since there is a cycle in the dependency graph
set_tests_properties(cycle_check PROPERTIES PASS_REGULAR_EXPRESSION "The inter-target dependency graph contains the following strongly connected component")
