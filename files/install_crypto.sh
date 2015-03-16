#!/usr/bin/env bash
set -e
set -x
pkgdir=/package
rootdir=${pkgdir}/libsodium
mkdir -p ${rootdir}
cd ${rootdir}
wget http://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar xaf LATEST.tar.gz
cd libsodium*
./configure && make -j4 && make check -j4 && make install -j4
ln -s /usr/local/lib/libsodium.* /lib64/
ln -s /usr/local/lib/libsodium.* /lib/
ldconfig
pip install pynacl pysodium
