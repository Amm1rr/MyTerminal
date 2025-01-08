#!/usr/bin/env zsh

# Fail on any command.
set -euo pipefail

# Function to clone or update a git repository
clone_or_update() {
    local repo_url="$1"
    local dir_name="$2"
    if [ -d "$dir_name" ]; then
        echo "Updating $dir_name..."
        (cd "$dir_name" && git pull --ff-only)
    else
        echo "Cloning $dir_name..."
        git clone "$repo_url" "$dir_name"
    fi
}

# Check and install Oh My Zsh if not already installed
if [[ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || {
        echo "Oh My Zsh installation failed." >&2
        exit 1
    }
else
    echo "Oh My Zsh is already installed."
fi

# Install or update plugins
PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$PLUGIN_DIR"
(
    cd "$PLUGIN_DIR"
    clone_or_update https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting
    clone_or_update https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
    clone_or_update https://github.com/zsh-users/zsh-completions zsh-completions
    clone_or_update https://github.com/zsh-users/zsh-history-substring-search zsh-history-substring-search
)

# Replace the configs with the saved ones
cp configs/.zshrc "$HOME/.zshrc"

# Copy themes and other configurations
THEME_DIR="$HOME/.oh-my-zsh/themes"
mkdir -p "$THEME_DIR"
cp configs/myterminal-agnoster.zsh-theme "$THEME_DIR/"
cp configs/"MyTerminal Yakuake.colorscheme" "$THEME_DIR/"
cp configs/"MyTerminal Yakuake.profile" "$THEME_DIR/"
cp configs/MyTerminal.colorscheme "$THEME_DIR/"
cp configs/MyTerminal.profile "$THEME_DIR/"
cp configs/MyTerminal.zsh "$HOME/.config/"

# Configure Yakuake profile
if grep -q "DefaultProfile" "$HOME/.config/yakuakerc"; then
    sed -i 's/DefaultProfile=.*/DefaultProfile=MyTerminal Yakuake.profile/' "$HOME/.config/yakuakerc"
else
    if grep -q "\\[Desktop Entry\\]" "$HOME/.config/yakuakerc"; then
        sed -i '/\\[Desktop Entry\\]/a DefaultProfile=MyTerminal Yakuake.profile' "$HOME/.config/yakuakerc"
    else
        echo -e "[Desktop Entry]\\nDefaultProfile=MyTerminal Yakuake.profile" >>"$HOME/.config/yakuakerc"
    fi
fi

# Switch the shell to ZSH if not already set
if [[ "$SHELL" != "$(which zsh)" ]]; then
    echo "Switching the default shell to ZSH..."
    chsh -s "$(which zsh)" || echo "Failed to change shell. Please run 'chsh -s $(which zsh)' manually."
fi
