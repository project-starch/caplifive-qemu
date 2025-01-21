FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    libglib2.0-dev \
    libfdt-dev \
    build-essential \
    wget \
    rsync \
    libpixman-1-dev \
    curl\
    bc\
    libncurses5-dev \
    libssl-dev \
    file \
    cpio \
    unzip \
    sed \
    make \
    binutils \
    diffutils \
    patch \
    perl \
    tar \
    findutils \
    bzip2 \
    expect \
    zlib1g-dev \
    ninja-build \
    libslirp-dev \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY . ./caplifive-qemu

RUN cd caplifive-qemu && \
    ./configure.sh && \
    cd build && \
    make -j4 && \
    make install