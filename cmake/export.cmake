################################################################################
## Prepare the project to be EXPORTed, generate cmake configuration files
################################################################################

string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_CAPS)
## Add all targets to the build-tree export set
export(TARGETS ${TARGETS} 
  FILE "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Targets.cmake")

## Export the package for use from the build-tree
## (this registers the build-tree with a global CMake-registry)
export(PACKAGE ${PROJECT_NAME})

## Create the ProjectConfig.cmake and ProjectConfigVersion.cmake files
file(RELATIVE_PATH REL_INCLUDE_DIR "${INSTALL_CMAKE_DIR}"
  "${INSTALL_INCLUDE_DIR}")
## ... projectConfig.cmake for the build-tree
set(CONF_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}")
configure_file("cmake/${PROJECT_NAME}Config.cmake.in"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake" @ONLY)
## ... projectConfig.cmake for the install-tree
set(CONF_INCLUDE_DIRS
  "\${${PROJECT_NAME_CAPS}}/${REL_INCLUDE_DIR}")
configure_file("cmake/${PROJECT_NAME}Config.cmake.in"
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}Config.cmake"
  @ONLY)
## ... projectConfigVersion.cmake for both
configure_file("cmake/${PROJECT_NAME}ConfigVersion.cmake.in"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake" @ONLY)

################################################################################
## INSTALL the configuration files
################################################################################
## Install the projectConfig.cmake and projectConfigVersion.cmake files
install (FILES
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}Config.cmake"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT dev)

## Install the export set to be used with the install-tree
install(EXPORT "${PROJECT_NAME}Targets"
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT dev)
