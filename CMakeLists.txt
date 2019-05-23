## CMake project file for nanocernlib

################################################################################
## PROJECT: nanocernlib
################################################################################
cmake_minimum_required (VERSION 3.0)
project (nanocernlib VERSION 1.0.0)
set (NANOCERNLIB_MAJOR_VERSION ${PROJECT_VERSION_MAJOR})
set (NANOCERNLIB_MINOR_VERSION ${PROJECT_VERSION_MINOR})
set (NANOCERNLIB_PATCH_VERSION ${PROJECT_VERSION_PATCH})
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
