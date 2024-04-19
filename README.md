# Capstone-QEMU README

CAPSTONE-QEMU modifies [QEMU](https://github.com/qemu/qemu) to emulate a Captainer system.

## Dependencies

Make sure your environment meets the [requirements of QEMU](https://wiki.qemu.org/Hosts/Linux).

If you are on Ubuntu/Debian, the following packages are suggested to be installed:

```sh
sudo apt install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev ninja-build libslirp-dev
```

## Build Instructions

Simply run the instructions below:

```sh
./configure.sh
cd build
make -j4
make install
```

The executable of Capstone-QEMU can be found in `installation/bin/qemu-system-riscv64`.

## Quick Start

3 scripts are included in this repo to start Capstone-QEMU:

```sh
# run capstone-qemu
./start.sh
```

```sh
# debug capstone-qemu with gdb
./debug.sh
```

```sh
# debug linux running on capstone-qemu with gdb
./gdb.sh
```
