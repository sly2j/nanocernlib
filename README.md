# nanocernlib

A collection of commonly used cernlib routines packaged with cmake to easily build on modern systems.

# Installation
Note: the following instructions are given assuming you are using `bash` as your shell.
## Choose a working prefix
```bash
export PREFIX="/path/to/your/prefix"; mkdir -p $PREFIX
```
## Install all necessary dependencies
Ensure you have `cmake` and `gfortran` installed

## Build and install nanocernlib
```bash
mkdir -p ${PREFIX}/src && cd ${PREFIX}/src
git clone https://gitlab.com/tmdmc/nanocernlib.git
mkdir -p nanocernlib/BUILD && cd nanocernlib/BUILD
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_PREFIX_PATH=${PREFIX}
make -j4
make install
```