#!/usr/bin/env bash
set -euo pipefail

echo "===== Installing Essential Build Tools ====="

# Check if gcc exists
if command -v gcc &> /dev/null; then
    echo "Build tools already installed: $(gcc --version | head -n1)"
else
    echo "Installing build-essential and unzip..."
    sudo apt update
    sudo apt install -y build-essential unzip
    echo "Essential tools installed successfully."
fi

echo "===== Essential setup complete ====="

