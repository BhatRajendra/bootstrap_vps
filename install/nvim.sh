#!/usr/bin/env bash
set -euo pipefail

if command -v nvim &> /dev/null; then
    echo "Neovim already installed: $(nvim --version | head -n1)"
else
    echo "Installing Neovim..."
    sudo apt update
    sudo apt install -y neovim
    echo "Neovim installed."
fi
