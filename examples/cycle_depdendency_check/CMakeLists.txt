# ---------------------------------------------------------
# Basic Project Setup
# ---------------------------------------------------------
cmake_minimum_required(VERSION 3.24)
project(check_cycles LANGUAGES C)


# Fail CMake generation if cyclic dependencies are detected.
set_property(GLOBAL PROPERTY GLOBAL_DEPENDS_NO_CYCLES ON)

# Show details about the internal CMake dependency graph
set_property(GLOBAL PROPERTY GLOBAL_DEPENDS_DEBUG_MODE ON)

# ---------------------------------------------------------
# Snippet
# ---------------------------------------------------------
add_subdirectory(src)
