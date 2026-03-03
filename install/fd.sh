#!/usr/bin/env bash
set -euo pipefail

if command -v fd &> /dev/null; then
    echo "fd already installed: $(fd --version)"
else
    echo "Installing fd..."
    sudo apt install -y fd-find

    # Create symlink if needed
    if ! command -v fd &> /dev/null; then
        sudo ln -s $(which fdfind) /usr/local/bin/fd
    fi

    echo "fd installed."
fi
