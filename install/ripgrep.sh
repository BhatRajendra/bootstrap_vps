#!/usr/bin/env bash
set -euo pipefail

if command -v rg &> /dev/null; then
    echo "ripgrep already installed: $(rg --version | head -n1)"
else
    echo "Installing ripgrep..."
    sudo apt install -y ripgrep
    echo "ripgrep installed."
fi
