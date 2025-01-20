#!/bin/bash

detect_package_manager() {
    if command -v apt-get &> /dev/null; then
        PKG_MANAGER="apt-get"
        PKG_UPDATE="sudo apt-get update"
        PKG_INSTALL="sudo apt-get install -y"
        DEBIAN_FRONTEND=noninteractive
    else
        echo "Unsupported package manager. Please install dependencies manually."
        exit 1
    fi
}

is_package_installed() {
    case "$PKG_MANAGER" in
        "apt-get")
            dpkg -s "$1" &> /dev/null
            ;;
    esac
}

install_packages() {
    local packages_to_install=()

    for pkg in "$@"; do
        if ! is_package_installed "$pkg"; then
            packages_to_install+=("$pkg")
        fi
    done

    if [ ${#packages_to_install[@]} -gt 0 ]; then
        echo "Installing missing packages: ${packages_to_install[*]}"
        $PKG_UPDATE
        $PKG_INSTALL "${packages_to_install[@]}"
    else
        echo "All specified packages are already installed."
    fi
}


main() {

    detect_package_manager

    local dependencies=(
    git
    libglib2.0-dev
    libfdt-dev
    build-essential
    wget
    rsync
    libpixman-1-dev
    curl
    bc
    libncurses5-dev
    libssl-dev
    file
    cpio
    unzip
    sed
    make
    binutils
    diffutils
    patch
    perl
    tar
    findutils
    bzip2
    zlib1g-dev
    ninja-build
    libslirp-dev
    python3-pip
    python3-venv
    )

    install_packages "${dependencies[@]}"

    if [ -f "configure.sh" ]; then
        chmod +x configure.sh
        ./configure.sh
    else
        echo "Error configure.sh not found"
        exit 1
    fi

    mkdir -p build
    cd build
    make -j$(nproc)
    make install

    echo "Local Build Complete"
}
main "$@"