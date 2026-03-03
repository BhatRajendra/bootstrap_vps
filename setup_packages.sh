#!/usr/bin/env bash
set -euo pipefail

echo "===== Updating package index ====="
sudo apt update

echo "===== Installing packages ====="

bash install/nvim.sh
bash install/fd.sh
bash install/fzf.sh
bash install/ripgrep.sh
bash install/yazi.sh
bash install/zellij.sh

echo "===== All packages installed successfully ====="
