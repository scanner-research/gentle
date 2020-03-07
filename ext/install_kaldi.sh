#!/bin/bash

# Prepare Kaldi
cd kaldi/tools
#make clean
make -j ${cores}
make -j ${cores} openfst
./extras/install_openblas.sh
cd ../src
# make clean (sometimes helpful after upgrading upstream?)
./configure --static --static-math=yes --static-fst=yes --use-cuda=no --openblas-root=../tools/OpenBLAS/install --fst-root=../tools/openfst-1.6.7
make -j ${cores} depend
cd ../../
