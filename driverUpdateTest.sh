#!/bin/bash

# 1. Check for GTX 1050 Ti
echo "Checking for NVIDIA GeForce GTX 1050 Ti..."
GPU_CHECK=$(lspci | grep -i "1050 Ti")

if [ -z "$GPU_CHECK" ]; then
    echo "Error: GTX 1050 Ti not detected on this system."
    exit 1
else
    echo "Success: Found $GPU_CHECK"
fi

# 2. Check if drivers are already installed
if ! command -v nvidia-smi &> /dev/null; then
    echo "Status: NVIDIA drivers are NOT installed."
    INSTALL_NEEDED=true
else
    echo "Status: NVIDIA drivers are present."
    nvidia-smi --query-gpu=driver_version --format=csv,noheader
    INSTALL_NEEDED=false
fi

# 3. Install or Update
if [ "$INSTALL_NEEDED" = true ]; then
    echo "Installing recommended drivers..."
    sudo ubuntu-drivers autoinstall
else
    echo "Checking for updates..."
    sudo apt update && sudo apt install --only-upgrade nvidia-driver-* -y
fi

# 4. Test Drivers
echo "Testing driver communication..."
if nvidia-smi; then
    echo "Test Passed: GPU is communicating with the driver."
else
    echo "Test Failed: Driver might require a reboot to initialize."
fi

echo "Process finished."
