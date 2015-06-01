################################################################################
## CMAKE Settings
################################################################################
include_directories("epio" "kerngen")

################################################################################
## Sources and install headers
################################################################################
file (GLOB SOURCES "epio/*.F"
                   "kerngen/*.c"
                   "kerngen/*.F")
#file (GLOB HEADERS "*.h" "*.inc")

################################################################################
## Compile and Link
################################################################################
add_library(miniCernlib_packlib STATIC ${SOURCES})
set_target_properties(miniCernlib_packlib PROPERTIES 
  VERSION ${MINICERNLIB_VERSION} 
  SOVERSION ${MINICERNLIB_SOVERSION})

################################################################################
## Export and Install
################################################################################
install(TARGETS miniCernlib_packlib
  EXPORT miniCernlibTargets
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib)
