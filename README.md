# 🛡️ Caplifive-QEMU

Caplifive-QEMU is an emulator of
a [Caplifive](https://capstone.kisp-lab.org/) system based on [QEMU](https://github.com/qemu/qemu).

---

## 📦 **Build Instructions**

### Build the Full System with Caplifive-Buildroot

To build the entire system using [Caplifive-Buildroot](https://github.com/project-starch/caplifive-buildroot):

1. Run the following script:
   ```bash
   ./build.sh
   ```

2. Choose your build environment (when prompted):
   - **Docker Build**: Enter `1`
   - **Local Build** (Debian-based machine): Enter `2`

**Note**: To interact with the Docker image:

```bash
docker run -it caplifive-qemu bash
```

### Build Caplifive-QEMU Only

> Option 1: Local Build (Debian-based Machine)
```bash
./local_build.sh
```
> Option 2: Docker Image Build
```bash
docker build -t <tag> .
```

## 🚀 **Quick Start**

### Running full system: Caplifive-QEMU with Caplifive-Buildroot
After a successful build, use the following scripts to start or debug Caplifive-QEMU.

1. Interact with the Docker Image (if using the docker installation method):
```bash
docker run -it <tag> bash
```
2. Navigate to the `CAPSTONE_QEMU` directory (inside the container if using Docker).

3. Then you can run these scripts:

```sh
# run caplifive-qemu
./start.sh
```

```sh
# debug caplifive-qemu with gdb
./debug.sh
```

```sh
# debug linux running on caplifive-qemu with gdb
./gdb.sh
```

4. To run the case studies, follow the steps in the [Caplifive-Buildroot](https://github.com/project-starch/caplifive-buildroot) repository

### ⚡ **Quick Notes:**
---

- Ensure you're in the correct directory when executing the scripts, especially if running within a Docker container.
- Customize the Docker image tag during build as needed (inside the respective images as well).
- If you are expecting a successful build using the build scripts, your workspace would be organized as follows:
```yaml
    workspace/
    ├── capstone-c/
    ├── caplifive-qemu/
    │   ├── start.sh
    │   ├── debug.sh
    │   ├── gdb.sh
    │   ├── build.sh
    │   ├── local_build.sh
    │   └── (other files)
    └── caplifive-buildroot/
```
---
