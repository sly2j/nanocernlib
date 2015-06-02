################################################################################
## Fortran Compiler Settings 
################################################################################
enable_language (Fortran)
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)
# gfortran
if (Fortran_COMPILER_NAME MATCHES "gfortran.*")
  set (CMAKE_Fortran_FLAGS_RELEASE "-ffixed-line-length-none -funroll-all-loops -fno-f2c -O3 -std=legacy")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-ffixed-line-length-none -fno-f2c -O0 -g -std=legacy")
# ifort (untested)
elseif (Fortran_COMPILER_NAME MATCHES "ifort.*")
  set (CMAKE_Fortran_FLAGS_RELEASE "-f77rtl -O3")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-f77rtl -O0 -g")
# g77
elseif (Fortran_COMPILER_NAME MATCHES "g77")
  set (CMAKE_Fortran_FLAGS_RELEASE "-ffixed-line-length-none -funroll-all-loops -fno-f2c -O3 -m32")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-ffixed-line-length-none -fno-f2c -O0 -g -m32")
# other
else ()
  message ("CMAKE_Fortran_COMPILER full path: " ${CMAKE_Fortran_COMPILER})
  message ("Fortran compiler: " ${Fortran_COMPILER_NAME})
  message ("No optimized Fortran compiler flags are known, we just try -O2...")
  set (CMAKE_Fortran_FLAGS_RELEASE "-O2")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
endif ()
