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

# 3️⃣ Copy .zshrc from configs
if [[ -f "configs/.zshrc" ]]; then
    echo "Copying .zshrc..."
    
    if [[ -f "$HOME/.zshrc" ]]; then
        echo "Backing up existing .zshrc to .zshrc.bak"
        mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
    fi

    cp configs/.zshrc "$HOME/.zshrc"
else
    echo "configs/.zshrc not found!"
fi

echo "===== Zsh setup complete ====="
echo "Log out and SSH again to start using zsh."

