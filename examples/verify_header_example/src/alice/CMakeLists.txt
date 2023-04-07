cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME alice)

add_library(${TARGET_NAME}
  src/alice.c
)


list(APPEND SUPPORTED_ARCH x86_64 x86)

# $<SEMICOLON> is needed when SUPPORTED_ARCH is used with genex
string(REPLACE ";" "$<SEMICOLON>" SUPPORTED_ARCH_GENEX "${SUPPORTED_ARCH}")

target_sources(${TARGET_NAME}
  PUBLIC
  FILE_SET HEADERS
  TYPE HEADERS
  BASE_DIRS
    include/api
    "$<$<IN_LIST:${CMAKE_SYSTEM_PROCESSOR},${SUPPORTED_ARCH_GENEX}>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}>"
  FILES
    "include/api/alice.h"
    "include/api/alice_data_types.h"
    "$<$<IN_LIST:${CMAKE_SYSTEM_PROCESSOR},${SUPPORTED_ARCH_GENEX}>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}/arch_specifics.h>"
)

target_link_libraries(${TARGET_NAME}
  PUBLIC
    bob::bob
)

install(TARGETS ${TARGET_NAME} EXPORT export_all FILE_SET HEADERS)
