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
include(cmake/config.cmake)
include(cmake/compiler.cmake)

## Add subdirectories
add_subdirectory(geant321)
add_subdirectory(packlib)
add_subdirectory(mathlib)

################################################################################
## NOTE: everything below this point creates and installs cmake configuration
##       files so the project works seamlessly with the find_package() function
##       when included from another project.
################################################################################
################################################################################
## Prepare the project to be EXPORTed, generate configuration files
################################################################################
## Add all targets to the build-tree export set
export(TARGETS miniCernlib_packlib 
               miniCernlib_mathlib 
               miniCernlib_geant321
  FILE "${PROJECT_BINARY_DIR}/miniCernlibTargets.cmake")

## Export the package for use from the build-tree
## (this registers the build-tree with a global CMake-registry)
export(PACKAGE miniCernlib)

## Create the miniCernlibConfig.cmake anc miniCernlibConfigVersion files
file(RELATIVE_PATH REL_INCLUDE_DIR "${INSTALL_CMAKE_DIR}"
  "${INSTALL_INCLUDE_DIR}")
## ... miniCernlibConfig.cmake for the build-tree
configure_file("cmake/miniCernlibConfig.cmake.in"
  "${PROJECT_BINARY_DIR}/miniCernlibConfig.cmake" @ONLY)
## ... miniCernlibConfig.cmake for the install tree
configure_file("cmake/miniCernlibConfig.cmake.in"
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/miniCernlibConfig.cmake" @ONLY)
## ... miniCernlibConfigVersion.cmake for both
configure_file("cmake/miniCernlibConfigVersion.cmake.in"
  "${PROJECT_BINARY_DIR}/miniCernlibConfigVersion.cmake" @ONLY)

################################################################################
## INSTALL the configuration files
################################################################################
## Install the miniCernlibConfig.cmake and miniCernlibConfigVersion.cmake files
install(FILES
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/miniCernlibConfig.cmake"
  "${PROJECT_BINARY_DIR}/miniCernlibConfigVersion.cmake"
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT dev)

## Install the export set for use with the install tree
install(EXPORT miniCernlibTargets DESTINATION 
  "${INSTALL_CMAKE_DIR}" COMPONENT dev)
