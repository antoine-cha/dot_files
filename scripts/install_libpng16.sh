#!/bin/bash
SRC_DIR=$1
LIBPNG=$2
set -xe
curl https://ftp-osl.osuosl.org/pub/libpng/src/libpng16/${LIBPNG}.tar.xz | \
    tar xvfJ - -C $SRC_DIR
pushd ${SRC_DIR}$LIBPNG
pwd
./configure
make -j 8
sudo make install
popd
