#!/usr/bin/env bash
set -euo pipefail

if command -v fzf &> /dev/null; then
    echo "fzf already installed: $(fzf --version)"
else
    echo "Installing fzf..."
    sudo apt install -y fzf
    echo "fzf installed."
fi
