# `CAPSTONE-QEMU` README

`CAPSTONE-QEMU` is built upon [QEMU](https://github.com/qemu/qemu).

## Build Steps

Install all required packages:

> On Ubuntu/Debian:

```sh
sudo apt-get install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev ninja-build
```

> Other platforms: Please refer to https://wiki.qemu.org/Hosts/Linux for details.

Then follow the steps below:

```sh
  ./configure.sh
  cd build
  make -j4
  make install
```

The binary file of `CAPSTONE-QEMU` can be found in `installation/bin/qemu-system-riscv64`.

## Run

```sh
  # start capstone-qemu
  ./start.sh
  # debug capstone-qemu with gdb
  ./debug.sh
  # debug linux running on capstone-qemu with gdb
  ./gdb.sh
```
