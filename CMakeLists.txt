## CMake project file for nanocernlib

################################################################################
## PROJECT: nanocernlib
################################################################################
cmake_minimum_required (VERSION 2.8)
project (nanocernlib)
set (NANOCERNLIB_MAJOR_VERSION 1)
set (NANOCERNLIB_MINOR_VERSION 0)
set (NANOCERNLIB_PATCH_VERSION 0)
set (NANOCERNLIB_VERSION 
  ${NANOCERNLIB_MAJOR_VERSION}.${NANOCERNLIB_MINOR_VERSION}.${NANOCERNLIB_PATCH_VERSION})
set (NANOCERNLIB_SOVERSION ${NANOCERNLIB_MAJOR_VERSION})

################################################################################
## CMAKE Settings 
################################################################################
include(cmake/options.cmake)
include(cmake/compiler.cmake)

################################################################################
## Add subdirectories
################################################################################
set (TARGETS "")
add_subdirectory(geant321)
add_subdirectory(packlib)
add_subdirectory(mathlib)
add_subdirectory(mclibs)
add_subdirectory(cfortran)

################################################################################
## Prepare the project to be EXPORTed, generate configuration files
################################################################################
include(cmake/export.cmake)
