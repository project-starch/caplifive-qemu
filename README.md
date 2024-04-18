# `CAPSTONE-QEMU` README

`CAPSTONE-QEMU` is built upon [QEMU](https://github.com/qemu/qemu).

## Build Steps

Install all required packages. If you are on Ubuntu/Debian, please install the following packages:

```sh
sudo apt install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev ninja-build libslirp-dev
```

> Other platforms: Please refer to https://wiki.qemu.org/Hosts/Linux for details.

Then simply follow the instructions below:

```sh
./configure.sh
cd build
make -j4
make install
```

The executable of `CAPSTONE-QEMU` can be found in `installation/bin/qemu-system-riscv64`.

## Run

3 scripts are available to run `CAPSTONE-QEMU`:

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
