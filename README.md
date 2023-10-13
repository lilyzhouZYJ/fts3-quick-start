# FTS3 Quick Start

## Setting up Development Environment using Visual Studio Code

If you use Visual Studio Code as the editor, you can use "Dev Container" to
simply set up the development Environment for FTS3.

### Prerequisite

Make sure you have `docker` installed.

If possible, we highly suggest to also install the `docker-buildx` extension.

### Opening `fts3` Project in Visual Studio Code Dev Container

1. Copy `.devcontainer` and `.vscode` to the root directory of your own fts3 source code:

```
# Clone the fts3 repo to your local machine
git clone https://github.com/cern-fts/fts3

# Clone this repo to your local machine
git clone https://github.com/fno2010/fts3-quick-start

# Copy .devcontainer to the root directory of fts3
cp -r fts3-quick-start/.devcontainer fts3/

# Copy .vscode to the root directory of fts3
cp -r fts3-quick-start/.vscode fts3/
```

2. Open fts3 source code in Visual Studio Code.

3. Install "Dev Containers" extension.

4. Open the editor commands with `Ctrl`-`Shift`-`P` and run `Dev containers: reopen in dev container`.

> NOTE: At the first time, visual studio code will build the dev container image. It will take a few minutes.

5. After the dev container is ready, install useful extensions inside the dev
container. The following extensions are highly recommended:

- CMake Tools
- C/C++
- C/C++ Extension Pack

## Building `fts3` from Source Code inside Dev Container

### Using CMake Tools Extension

If you have installed "Cmake Tools" extension, building `fts3` will be simple:
Open the editor commands with `Ctrl`-`Shift`-`P` and run `CMake: Build`.

### Using CLI

You can also open a terminal inside the current running Visual Studio Code Dev
Container and run the commands directly:

```
mkdir -p build
cd build
cmake3 ../ -DALLBUILD=ON
make
```
