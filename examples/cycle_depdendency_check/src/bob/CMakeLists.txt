cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME bob)

add_library(${TARGET_NAME}
  src/bob.c
)

add_library(small_world::${TARGET_NAME} ALIAS ${TARGET_NAME})

target_link_libraries(${TARGET_NAME}
  PRIVATE
  small_world::alice
)
