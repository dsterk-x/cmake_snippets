cmake_minimum_required(VERSION 3.24)


set(TARGET_NAME alice)

add_library(${TARGET_NAME}
  src/alice.c
)

# cmake-lint: disable=C0301
target_sources(${TARGET_NAME}
  PUBLIC
  FILE_SET HEADERS
  TYPE HEADERS
  BASE_DIRS
    include/api
    # IN_LIST seems not to work here.
    # cmake-lint: disable=C0301
    #"$<$<IN_LIST:${CMAKE_SYSTEM_PROCESSOR},x86_64;x86>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}>"
    "$<$<STREQUAL:${CMAKE_SYSTEM_PROCESSOR},x86>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}>"
    "$<$<STREQUAL:${CMAKE_SYSTEM_PROCESSOR},x86_64>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}>"
  FILES
    "include/api/alice.h"
    "include/api/alice_data_types.h"
    # IN_LIST seems not to work here.
    #"$<$<IN_LIST:${CMAKE_SYSTEM_PROCESSOR},x86_64;x86>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}/arch_specifics.h>"
    "$<$<STREQUAL:${CMAKE_SYSTEM_PROCESSOR},x86>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}/arch_specifics.h>"
    "$<$<STREQUAL:${CMAKE_SYSTEM_PROCESSOR},x86_64>:${CMAKE_CURRENT_LIST_DIR}/include/var/${CMAKE_SYSTEM_PROCESSOR}/arch_specifics.h>"
)

target_link_libraries(${TARGET_NAME}
  PUBLIC
    bob::bob
)

install(TARGETS ${TARGET_NAME} EXPORT export_all FILE_SET HEADERS)
