################################################################################
## global cernlib defines
################################################################################
if (${UNIX})
  add_definitions(
    "-DCERNLIB_LINUX"
    "-DCERNLIB_UNIX"
    "-DCERNLIB_LNX"
    "-DCERNLIB_QMGLIBC"
    "-DLinux")
else ()
  message( FATAL_ERROR "Unable to build on non-Unix system, aborting..." )
endif ()

## OSX specific
if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  add_definitions("-DCERNLIB_MACOSX" "-DLinux")
endif ()

################################################################################
## C Compiler Settings 
################################################################################
enable_language (C)

## set special compiler flags
get_filename_component(C_COMPILER_NAME ${CMAKE_C_COMPILER} NAME)
## gcc and clang
if (C_COMPILER_NAME MATCHES "cc.*" OR 
    C_COMPILER_NAME MATCHES "gcc.*" OR 
    C_COMPILER_NAME MATCHES "clang.*")
  set (CC_EXTRA_FLAGS "-funroll-loops -fomit-frame-pointer -ftree-vectorize")
  set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CC_EXTRA_FLAGS}")
  set (CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${CC_EXTRA_FLAGS}")
  set (CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} ${CC_EXTRA_FLAGS}")
  set (CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} ${CC_EXTRA_FLAGS}")
## add additional compilers here
## other compilers use the defaults:
else ()
  message ("CMAKE_C_COMPILER full path: " ${CMAKE_C_COMPILER})
  message ("C compiler: " ${C_COMPILER_NAME})
  message ("No optimized C compiler flags are known, using the defaults...")
  message ("Add the correct rules to cmake/compiler.cmake if other behavior is"
           "required.")
endif ()

################################################################################
## Fortran Compiler Settings 
################################################################################
enable_language (Fortran)

## set special compiler flags
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)
## gfortran
if (Fortran_COMPILER_NAME MATCHES "gfortran.*")

  add_definitions("-DCERNLIB_GFORTRAN -Df2cFortran")
  set (gfortran_EXTRA_FLAGS "-funroll-loops -fomit-frame-pointer -ftree-vectorize -fno-automatic -fno-second-underscore")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${gfortran_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} ${gfortran_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_DEBUG   "${CMAKE_Fortran_FLAGS_DEBUG} ${gfortran_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_RELWITHDEBINFO "${CMAKE_Fortran_FLAGS_RELWITHDEBINFO} ${gfortran_EXTRA_FLAGS}")

## g77
elseif (Fortran_COMPILER_NAME MATCHES "g77.*")

  add_definitions("-Df2cFortran")
  set (g77_EXTRA_FLAGS "-fugly-complex -fno-automatic -fno-second-underscore")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${g77_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} ${g77_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_DEBUG   "${CMAKE_Fortran_FLAGS_DEBUG} ${g77_EXTRA_FLAGS}")
  set (CMAKE_Fortran_FLAGS_RELWITHDEBINFO "${CMAKE_Fortran_FLAGS_RELWITHDEBINFO} ${g77_EXTRA_FLAGS}")

## add additional compilers here
## other compilers use the defaults:
else ()
  message ("CMAKE_Fortran_COMPILER full path: " ${CMAKE_Fortran_COMPILER})
  message ("Fortran compiler: " ${Fortran_COMPILER_NAME})
  message ("No optimized Fortran compiler flags are known, using the defaults...")
  message ("Add the correct rules to cmake/compiler.cmake if other behavior is"
           "required.")
endif ()
