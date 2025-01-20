# 🛡️ Capstone-QEMU

Capstone-QEMU enhances [QEMU](https://github.com/qemu/qemu) to emulate a Captainer system, providing powerful tools for testing and development.

---

## 📦 **Build Instructions**

### Build the Full System with Captainer-Buildroot

To build the entire system using [Captainer-Buildroot](https://github.com/project-starch/captainer-buildroot):

1. Run the following script:
   ```bash
   ./build.sh
   ```

2. Choose your build environment (when prompted):
   - **Docker Build**: Enter `1`
   - **Local Build** (Debian-based machine): Enter `2`

**Note**: To interact with the Docker image:

```bash
docker run -it capstone-qemu bash
```

### Build Capstone-QEMU Only

> Option 1: Local Build (Debian-based Machine)
```bash
./build.sh
```
> Option 2: Docker Image Build
```bash
docker build -t <tag> .
```

## 🚀 **Quick Start**

### Running full system: Capstone-QEMU with Captainer-Buildroot
After a successful build, use the following scripts to start or debug Capstone-QEMU.

1. Interact with the Docker Image (if using the docker installation method):
```bash
docker run -it <tag> bash
```
2. Navigate to the `CAPSTONE_QEMU` directory (inside the container if using Docker).

3. Then you can run these scripts:

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

4. To run the case studies, follow the steps in the [Captainer-Buildroot](https://github.com/project-starch/captainer-buildroot) repository

### ⚡ **Quick Notes:**
---

- Ensure you're in the correct directory when executing the scripts, especially if running within a Docker container.
- Customize the Docker image tag during build as needed (inside the respective images as well).
- If you are expecting a successful build using the build scripts, your workspace would be organized as follows:
```yaml
    workspace/
    ├── capstone-c/
    ├── capstone-qemu/
    │   ├── start.sh
    │   ├── debug.sh
    │   ├── gdb.sh
    │   ├── build.sh
    │   ├── local_build.sh
    │   └── (other files)
    └── captainer-buildroot/
```
---