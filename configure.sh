set -e

mkdir -p build
cd build
../configure --enable-slirp --enable-debug --target-list=riscv64-softmmu --prefix=$(pwd)/../installation

