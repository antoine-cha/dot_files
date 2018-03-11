#!/bin/bash
SRC_DIR=$1
HARFBUZZ=$2
set -xe
curl https://www.freedesktop.org/software/harfbuzz/release/${HARFBUZZ}.tar.bz2 | \
    tar xjf - -C $SRC_DIR
pushd ${SRC_DIR}$HARFBUZZ
pwd
./autogen.sh
make -j 8
sudo make install
popd
