## CMake project file for miniCernlib

################################################################################
## PROJECT: miniCernlib
################################################################################
cmake_minimum_required (VERSION 2.8)
project (miniCernlib)
set (MINICERNLIB_MAJOR_VERSION 1)
set (MINICERNLIB_MINOR_VERSION 0)
set (MINICERNLIB_PATCH_VERSION 0)
set (MINICERNLIB_VERSION 
  ${MINICERNLIB_MAJOR_VERSION}.${MINICERNLIB_MINOR_VERSION}.${MINICERNLIB_PATCH_VERSION})
set (MINICERNLIB_SOVERSION ${MINICERNLIB_MAJOR_VERSION})

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
add_subdirectory(cfortran)

################################################################################
## Prepare the project to be EXPORTed, generate configuration files
################################################################################
include("cmake/export.cmake")
