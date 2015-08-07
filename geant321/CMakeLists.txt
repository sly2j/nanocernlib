################################################################################
## CMAKE Settings
################################################################################
set (LIBRARY "nanocernlib_geant321")
set (TARGETS ${TARGETS} ${LIBRARY} PARENT_SCOPE)

################################################################################
## Sources and install headers
################################################################################
file (GLOB SOURCES "*/*.F")

################################################################################
## Include directories
################################################################################
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

################################################################################
## Compile and Link
################################################################################
add_library(${LIBRARY} STATIC ${SOURCES})
set_target_properties(${LIBRARY} PROPERTIES 
  VERSION ${NANOCERNLIB_VERSION} 
  SOVERSION ${NANOCERNLIB_SOVERSION})

################################################################################
## Export and Install
################################################################################
install(TARGETS ${LIBRARY}
  EXPORT "${PROJECT_NAME}-targets"
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib)
## install the headers
install(DIRECTORY "geant321" 
  DESTINATION "${INSTALL_INCLUDE_DIR}" COMPONENT dev)
