#!/bin/bash

export CPPFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CXXFLAGS="-g -fomit-frame-pointer -O3 -Wno-sign-compare -Wno-write-strings $CXXFLAGS"

chmod +x configure

./configure \
    --prefix="$PREFIX" \
    --libdir="$PREFIX/lib"

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install
