#!/bin/bash
export folder=$(pwd)
cd ~
git clone https://github.com/nerdaxe/cgminer-nerdaxe.git
cd cgminer-nerdaxe
autoreconf -fi
CFLAGS="-O2 -msse2" ./configure --host=i686-w64-mingw32.static --disable-shared --enable-nerdaxe
make
strip cgminer.exe
