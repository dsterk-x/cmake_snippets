cmake_minimum_required(VERSION 3.25)

# ---------------------------------------------------------
# Build all sub-snippets
# ---------------------------------------------------------

# cache no initial type
add_test(
  NAME cache_no_initial_type
  COMMAND ${CMAKE_CTEST_COMMAND}
    --build-and-test
      ${CMAKE_CURRENT_LIST_DIR}/cache
      ${CMAKE_CURRENT_LIST_DIR}/cache/build/build_no_type
    --build-generator "Unix Makefiles"
    --build-options "-DFOO=foo"
)

# cache with initial type
add_test(
  NAME cache_with_initial_type
  COMMAND ${CMAKE_CTEST_COMMAND}
    --build-and-test
      ${CMAKE_CURRENT_LIST_DIR}/cache
      ${CMAKE_CURRENT_LIST_DIR}/cache/build/build_with_type
    --build-generator "Unix Makefiles"
    --build-options "-DFOO:STRING=foo"
)

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
      ${CMAKE_CURRENT_LIST_DIR}/cycle_check
      ${CMAKE_CURRENT_LIST_DIR}/cycle_check/build
    --build-generator "Unix Makefiles" -j 8
)
# Test will fail since there is a cycle in the dependency graph
set_tests_properties(cycle_check PROPERTIES WILL_FAIL TRUE)

# string replace
add_test(
  NAME string_replace
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_LIST_DIR}/string/string_replace.cmake
)
set_tests_properties(string_replace PROPERTIES DISABLED TRUE)
