cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME ut_alice)

add_executable(${TARGET_NAME}
  ut_alice.c
)
target_link_libraries(${TARGET_NAME} PRIVATE small_world::alice)

add_small_world_unit_test(
  TEST_NAME ut_alice.return_1.auto_rebuild
  TEST_TARGET ${TARGET_NAME}
)
