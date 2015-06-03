################################################################################
## CMAKE Settings
################################################################################
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

################################################################################
## Sources and install headers
################################################################################
file (GLOB SOURCES "gen/?/*.F")
#file (GLOB HEADERS "*.h" "*.inc")

################################################################################
## Compile and Link
################################################################################
add_library(miniCernlib_mathlib STATIC ${SOURCES})
set_target_properties(miniCernlib_mathlib PROPERTIES 
  VERSION ${MINICERNLIB_VERSION} 
  SOVERSION ${MINICERNLIB_SOVERSION})

################################################################################
## Export and Install
################################################################################
install(TARGETS miniCernlib_mathlib
  EXPORT miniCernlibTargets
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib)
