cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME alice)

add_library(${TARGET_NAME}
  src/alice.c
)
add_library(small_world::${TARGET_NAME} ALIAS ${TARGET_NAME})

target_sources(${TARGET_NAME}
  PUBLIC
  FILE_SET HEADERS
  TYPE HEADERS
  BASE_DIRS include
  FILES
    "include/alice.h"
)

add_subdirectory(test)
