#!/usr/bin/env zsh

# Fail on any command.
set -euo pipefail

# Install ZSH and related tools.
echo "Installing ZSH and related tools..."
sudo pacman -S --needed --noconfirm git zsh curl thefuck

# Install OhMyZsh only if not already installed.
if [[ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || {
        echo "Oh My Zsh installation failed." >&2
        exit 1
    }
else
    echo "Oh My Zsh is already installed."
fi
