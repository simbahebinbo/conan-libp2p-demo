#!/bin/sh

rm -rf build
mkdir build
cd build
conan install .. --build=missing
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=./Release/generators/conan_toolchain.cmake ..
cmake --build . --config Release
cd ..

