
function(add_small_world_unit_test)
  set(options)
  set(oneValueArgs
   TEST_NAME
   TEST_TARGET
  )
  set(multiValueArgs)
  cmake_parse_arguments(f "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  # Causes a rebuild of the relevant build tree if files have changed
  add_custom_target(
    WRAPPER_${f_TEST_NAME}
    COMMAND $<TARGET_FILE:${f_TEST_TARGET}>
  )
  add_dependencies(WRAPPER_${f_TEST_NAME} ${f_TEST_TARGET})

  add_test(
    NAME ${f_TEST_NAME}
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target "WRAPPER_${f_TEST_NAME}"
  )

endfunction()
