################################################################################
## CMAKE Settings
################################################################################
include_directories("cspack" "epio" "ffread" "hbook" "zebra")
include_directories("kernlib/kernbit")
include_directories("kernlib/kernnum")
include_directories("kernlib/kerngen")
include_directories(${PROJECT_SOURCE_DIR})

################################################################################
## Sources and install headers
################################################################################
include ("cmake/cspack.cmake")
include ("cmake/epio.cmake")
include ("cmake/ffread.cmake")
include ("cmake/hbook.cmake")
include ("cmake/kernlib.cmake")
include ("cmake/zebra.cmake")

################################################################################
## Compile and Link
################################################################################
add_library(miniCernlib_packlib STATIC 
  ${CSPACK_SOURCES}
  ${EPIO_SOURCES}
  ${FFREAD_SOURCES}
  ${HBOOK_SOURCES}
  ${KERNLIB_SOURCES}
  ${ZEBRA_SOURCES})
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
