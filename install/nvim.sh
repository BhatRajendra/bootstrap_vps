#!/usr/bin/env bash
set -euo pipefail

if command -v nvim &> /dev/null; then
    echo "Neovim already installed: $(nvim --version | head -n1)"
else
    echo "Installing latest Neovim..."

    sudo apt install -y curl

    cd /tmp
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

    rm nvim-linux-x86_64.tar.gz

    echo "Neovim installed successfully."
fi

