# CoreX
**CoreX** is a **minimal**, **source-based** and **open-source Linux distribution** that aims to stay as minimal as possible.

## Components
**CoreX** uses these components
- **Linux** as the kernel
- **BusyBox** as userland
- **GRUB** as bootloader
- **CPX** as package manager
- **musl** as native toolchain

## Download
To install **CoreX**, you can choose between building the **ISO** yourself see [Building ISO](#building-iso) or simply by downloading the latest release (coming soon)

## Building ISO
To build the **ISO**, you need to install these **build dependencies:**
```
git wget tar gzip grub cpio xorriso make musl-gcc gcc bc flex bison zstd
```

To start the **setup** run: ```curl -fsSL https://raw.githubusercontent.com/Ietsiee/CoreX/main/scripts/setup.sh | sh```

> [!NOTE]
> Building the ISO can take several hours, depending on your hardware.

