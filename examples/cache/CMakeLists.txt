# ---------------------------------------------------------
# Basic Project Setup
# ---------------------------------------------------------
cmake_minimum_required(VERSION 3.24)
project(variables LANGUAGES NONE)

# ---------------------------------------------------------
# Snippet
# ---------------------------------------------------------
macro(print_properties)
  get_property(FOO_TYPE CACHE FOO PROPERTY TYPE)
  get_property(FOO_VALUE CACHE FOO PROPERTY VALUE)

  message("FOO has type: ${FOO_TYPE}")
  message("FOO has value: ${FOO_VALUE}")
endmacro()

message("Initial properties of FOO")
print_properties()

message("Chaned properties of FOO")
set(FOO "bar" CACHE INTERNAL "")
print_properties()

message("Chaned properties of FOO")
set(FOO "bar" CACHE INTERNAL "" FORCE)
print_properties()
