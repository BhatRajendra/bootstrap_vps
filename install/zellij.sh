#!/usr/bin/env bash
set -euo pipefail

if command -v zellij &> /dev/null; then
    echo "zellij already installed: $(zellij --version)"
else
    echo "Installing zellij..."
    sudo apt install -y zellij
    echo "zellij installed."
fi
