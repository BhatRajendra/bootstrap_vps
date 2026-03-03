#!/usr/bin/env bash
set -euo pipefail

if command -v zellij &> /dev/null; then
    echo "zellij already installed: $(zellij --version)"
else
    echo "Installing latest Zellij..."

    ARCH="$(uname -m)"

    case "$ARCH" in
        x86_64)
            TARGET="x86_64-unknown-linux-musl"
            ;;
        aarch64|arm64)
            TARGET="aarch64-unknown-linux-musl"
            ;;
        *)
            echo "Unsupported architecture: $ARCH"
            exit 1
            ;;
    esac

    TMP_DIR="$(mktemp -d)"
    cd "$TMP_DIR"

    curl -LO "https://github.com/zellij-org/zellij/releases/latest/download/zellij-$TARGET.tar.gz"

    tar -xzf "zellij-$TARGET.tar.gz"

    sudo mv zellij /usr/local/bin/
    sudo chmod +x /usr/local/bin/zellij

    cd ~
    rm -rf "$TMP_DIR"

    echo "Zellij installed successfully."
fi

