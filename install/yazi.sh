#!/usr/bin/env bash
set -euo pipefail

if command -v yazi &> /dev/null; then
    echo "yazi already installed: $(yazi --version)"
else
    echo "Installing yazi..."

    sudo apt install -y curl unzip

    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    curl -L https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -o yazi.zip
    unzip yazi.zip
    sudo mv yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/
    sudo chmod +x /usr/local/bin/yazi

    cd ~
    rm -rf "$TMP_DIR"

    echo "yazi installed."
fi
