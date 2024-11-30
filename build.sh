#!/bin/bash


clone_repo() {
    local repo_url=$1
    local repo_dir=$2
    
    if [ ! -d "$repo_dir" ]; then
        echo "Cloning $repo_url..."
        git clone "$repo_url" "$repo_dir"
    else
        echo "$repo_dir already exists. Skipping clone."
    fi
}


init_submodules() {
    local repo_dir=$1
    
    cd "$repo_dir" || exit
    if [ -d ".git/modules" ] && [ "$(git submodule status --recursive)" != "" ]; then
        echo "Submodules already initialized in $repo_dir."
    else
        echo "Initializing submodules in $repo_dir..."
        git submodule update --init --recursive
    fi
    cd - > /dev/null || exit
}


QEMU_REPO="../capstone-qemu"
BUILDROOT_REPO="../captainer-buildroot"
CAPSTONE_C_REPO="../capstone-c"

clone_repo "https://github.com/project-starch/captainer-buildroot.git" "$BUILDROOT_REPO"
clone_repo "https://github.com/jasonyu1996/capstone-c.git" "$CAPSTONE_C_REPO"

init_submodules .
init_submodules "$BUILDROOT_REPO"
init_submodules "$CAPSTONE_C_REPO"

# Prompt for installation type
echo "Choose installation method:"
echo "1. Docker"
echo "2. Local Machine"
read -p "Enter choice (1 or 2): " choice

case $choice in
    1)
        echo "Building Docker containers..."

        docker build -t qemu-build "$QEMU_REPO" || { echo "Failed to build QEMU container"; exit 1; }
        cd $CAPSTONE_C_REPO
        docker build -t capstone-c "$CAPSTONE_C_REPO" || { echo "Failed to build Capstone-C container"; exit 1; }
        cd $BUILDROOT_REPO
        docker build -t capstone-qemu "$BUILDROOT_REPO" || { echo "Failed to build Buildroot container"; exit 1; }
        cd $QEMU_REPO
        # echo "Pruning unused Docker containers and images, excluding built ones..."
        # docker images -q | grep -v -E "$(docker images qemu-build -q)|$(docker images capstone-qemu -q)|$(docker images capstone-c -q)" | xargs docker rmi -f        
        ;;
        
    2)
        bash local_build.sh
        cd $CAPSTONE_C_REPO
        bash local_build.sh
        cd $BUILDROOT_REPO
        bash local_build.sh
        cd $QEMU_REPO

        ;;
        
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Setup completed successfully!"
