#!/bin/bash

export CXXFLAGS="-g $CXXFLAGS"

chmod +x configure

./configure \
    --prefix="$PREFIX" \
    --libdir="$PREFIX/lib"

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check
fi
make install
