#!/bin/bash
# Build asv_wave_sim for PX4 integration

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALL_DIR="$SCRIPT_DIR/install"

echo "Building asv_wave_sim for PX4..."
echo "Install directory: $INSTALL_DIR"

# Build gz-waves
cd "$SCRIPT_DIR/gz-waves"
mkdir -p build
cd build

echo "Configuring with CMake..."
export GZ_VERSION=harmonic
cmake .. -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"

echo "Building..."
make -j$(nproc)

echo "Installing..."
make install

echo ""
echo "====================================="
echo " asv_wave_sim built successfully!"
echo "====================================="
echo "Installed to: $INSTALL_DIR"
echo ""
echo "Add to your environment:"
echo "export LD_LIBRARY_PATH=$INSTALL_DIR/lib:\$LD_LIBRARY_PATH"
echo "export GZ_SIM_SYSTEM_PLUGIN_PATH=$INSTALL_DIR/lib:\$GZ_SIM_SYSTEM_PLUGIN_PATH"
echo ""
