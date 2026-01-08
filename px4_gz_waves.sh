#!/bin/bash
#
# PX4 SITL launcher with gz_waves buoyancy support
# This script sets up the environment and runs PX4 SITL with Gazebo and wave simulation

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PX4_ROOT="$SCRIPT_DIR/../../.."
INSTALL_DIR="$SCRIPT_DIR/install"

# Set environment for gz_waves
export LD_LIBRARY_PATH="$INSTALL_DIR/lib:$LD_LIBRARY_PATH"
export GZ_SIM_SYSTEM_PLUGIN_PATH="$INSTALL_DIR/lib:$GZ_SIM_SYSTEM_PLUGIN_PATH"
export GZ_SIM_RESOURCE_PATH="$SCRIPT_DIR/gz-waves-models:$SCRIPT_DIR/worlds:$PX4_ROOT/Tools/simulation/gz/models:$GZ_SIM_RESOURCE_PATH"

# World file - default to boat_world for warden model
export PX4_GZ_WORLD="${PX4_GZ_WORLD:-boat_world}"

# Execute the normal PX4 SITL command
cd "$PX4_ROOT"
exec "$@"
