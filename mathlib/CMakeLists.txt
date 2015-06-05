################################################################################
## CMAKE Settings
################################################################################
set (LIBRARY "miniCernlib_mathlib")
set (TARGETS ${TARGETS} ${LIBRARY} PARENT_SCOPE)

################################################################################
## Sources and install headers
################################################################################
file (GLOB SOURCES "gen/?/*.F")

################################################################################
## Include directories
################################################################################
include_directories("gen")

################################################################################
## Compile and Link
################################################################################
add_library(${LIBRARY} STATIC ${SOURCES})
set_target_properties(${LIBRARY} PROPERTIES 
  VERSION ${MINICERNLIB_VERSION} 
  SOVERSION ${MINICERNLIB_SOVERSION})

################################################################################
## Export and Install
################################################################################
install(TARGETS ${LIBRARY}
  EXPORT "${PROJECT_NAME}Targets"
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib)
## install the headers
install(DIRECTORY "gen/gen" 
  DESTINATION "${INSTALL_INCLUDE_DIR}/mathlib" COMPONENT dev)
