#!/usr/bin/env zsh

# Fail on any command.
set -euo pipefail

# Ensure Powerline and fonts are installed.
echo "Installing Powerline and fonts..."
if ! command -v powerline-daemon &>/dev/null; then
    sudo pacman -S --noconfirm powerline powerline-fonts
fi

# Install Patched Fonts.
echo "Installing patched fonts..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cp -a fonts/. "$FONT_DIR/"
fc-cache -vf "$FONT_DIR"

# Copy Vim configuration.
echo "Copying Vim configuration..."
cp configs/.vimrc "$HOME/.vimrc"
