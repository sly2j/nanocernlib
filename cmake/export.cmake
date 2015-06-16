################################################################################
## Prepare the project to be EXPORTed, generate cmake configuration files
################################################################################

## utility string of project name in all caps
string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_CAPS)

## lets get all the global defines associated with the project
get_directory_property(CONF_DEFINITIONS_RAW
  DIRECTORY ${PROJECT_SOURCE_DIR} 
  COMPILE_DEFINITIONS)
foreach(define ${CONF_DEFINITIONS_RAW})
  set(CONF_DEFINITIONS ${CONF_DEFINITIONS} "-D${define}")
endforeach ()

## Add all targets to the build-tree export set
export(TARGETS ${TARGETS} 
  FILE "${PROJECT_BINARY_DIR}/${PROJECT_NAME}-targets.cmake")

## Export the package for use from the build-tree
## (this registers the build-tree with a global CMake-registry)
export(PACKAGE ${PROJECT_NAME})

## Create the Project-config.cmake and Project-config-version.cmake files
file(RELATIVE_PATH REL_INCLUDE_DIR "${INSTALL_CMAKE_DIR}"
  "${INSTALL_INCLUDE_DIR}")
## ... project-config.cmake for the build-tree
set(CONF_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}")
configure_file("cmake/${PROJECT_NAME}-config.cmake.in"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}-config.cmake" @ONLY)
## ... project-config.cmake for the install-tree
set(CONF_INCLUDE_DIRS
  "\${${PROJECT_NAME_CAPS}_CMAKE_DIR}/${REL_INCLUDE_DIR}")
configure_file("cmake/${PROJECT_NAME}-config.cmake.in"
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}-config.cmake"
  @ONLY)
## ... project-config-version.cmake for both
configure_file("cmake/${PROJECT_NAME}-config-version.cmake.in"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake" @ONLY)

################################################################################
## INSTALL the configuration files
################################################################################
## Install the project-config.cmake and project-config-version.cmake files
install (FILES
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}-config.cmake"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake"
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT dev)

## Install the export set to be used with the install-tree
install(EXPORT "${PROJECT_NAME}-targets"
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT dev)
