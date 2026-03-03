#!/usr/bin/env bash
set -euo pipefail

echo "===== Setting up Zsh ====="

# 1️⃣ Install zsh if missing
if command -v zsh &> /dev/null; then
    echo "Zsh already installed: $(zsh --version)"
else
    echo "Installing zsh..."
    sudo apt update
    sudo apt install -y zsh
    echo "Zsh installed."
fi

# 2️⃣ Set zsh as default shell
if [[ "$SHELL" != *"zsh" ]]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
else
    echo "Zsh already default shell."
fi

# 3️⃣ Symlink .zshrc from repo
if [[ -f "configs/.zshrc" ]]; then
    echo "Linking .zshrc..."

    # Backup existing file if it's NOT already a symlink
    if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
        echo "Backing up existing .zshrc to .zshrc.bak"
        mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
    fi

    # Remove old symlink if exists
    rm -f "$HOME/.zshrc"

    # Create symlink
    ln -s "$(pwd)/configs/.zshrc" "$HOME/.zshrc"

    echo "Symlink created."
else
    echo "configs/.zshrc not found!"
fi

echo "===== Zsh setup complete ====="
echo "Log out and SSH again to start using zsh."

