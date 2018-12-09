#!/bin/bash

# Prepare Kaldi
cd kaldi/tools
#make clean
make -j ${cores}
./extras/install_openblas.sh
cd ../src
#make clean
./configure --static --static-math=yes --static-fst=yes --use-cuda=no --openblas-root=../tools/OpenBLAS/install
make -j ${cores} depend
cd ../../
