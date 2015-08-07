################################################################################
## CMAKE Settings
################################################################################
set (LIBRARY "nanocernlib_packlib")
set (TARGETS ${TARGETS} ${LIBRARY} PARENT_SCOPE)

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
add_library(${LIBRARY} STATIC 
  ${CSPACK_SOURCES}
  ${EPIO_SOURCES}
  ${FFREAD_SOURCES}
  ${HBOOK_SOURCES}
  ${KERNLIB_SOURCES}
  ${ZEBRA_SOURCES})
set_target_properties(${LIBRARY} PROPERTIES 
  VERSION ${NANOCERNLIB_VERSION} 
  SOVERSION ${NANOCERNLIB_SOVERSION})

################################################################################
## Include directories
################################################################################
include_directories(${PROJECT_SOURCE_DIR})
include_directories("cspack" "epio" "ffread" "hbook" "zebra")
include_directories("kernlib/kernbit")
include_directories("kernlib/kernnum")
include_directories("kernlib/kerngen")

################################################################################
## Export and Install
################################################################################
install(TARGETS ${LIBRARY}
  EXPORT "${PROJECT_NAME}-targets"
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib)
## install the headers
install(DIRECTORY "cspack/cspack"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib" COMPONENT dev)
install(DIRECTORY "epio/epio"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib" COMPONENT dev)
install(DIRECTORY "ffread/ffread"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib" COMPONENT dev)
install(DIRECTORY "hbook/hbook"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib" COMPONENT dev)
install(DIRECTORY "zebra/zebra"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib" COMPONENT dev)
install(DIRECTORY "kernlib/kernbit/kernbit"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib/kernlib" COMPONENT dev)
install(DIRECTORY "kernlib/kernnum/kernnum"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib/kernlib" COMPONENT dev)
install(DIRECTORY "kernlib/kerngen/kerngen"
  DESTINATION "${INSTALL_INCLUDE_DIR}/packlib/kernlib" COMPONENT dev)
