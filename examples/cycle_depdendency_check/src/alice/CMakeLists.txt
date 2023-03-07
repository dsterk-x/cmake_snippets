cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME alice)

add_library(${TARGET_NAME}
  src/alice.c
)
add_library(small_world::${TARGET_NAME} ALIAS ${TARGET_NAME})

target_link_libraries(${TARGET_NAME}
  PUBLIC
  small_world::bob
)
