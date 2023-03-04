cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME bob)

add_library(${TARGET_NAME}
  src/bob.c
)

add_library(bob::${TARGET_NAME} ALIAS ${TARGET_NAME})

target_sources(${TARGET_NAME}
  PUBLIC
  FILE_SET HEADERS
  TYPE HEADERS
  BASE_DIRS include
  FILES "include/bob.h"
)

install(TARGETS ${TARGET_NAME} EXPORT export_all FILE_SET HEADERS)
