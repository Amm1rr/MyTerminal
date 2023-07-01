# Fail on any command.
set -eux pipefail

# Install plug-ins (you can git-pull to update them later).
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)

# Replace the configs with the saved one.
sudo cp configs/.zshrc ~/.zshrc

# Copy the modified Agnoster Theme
sudo cp configs/myterminal-agnoster.zsh-theme ~/.oh-my-zsh/themes/myterminal-agnoster.zsh-theme
sudo cp configs/"MyTerminal Yakuake.colorscheme" ~/.oh-my-zsh/themes/"MyTerminal Yakuake.colorscheme"
sudo cp configs/"MyTerminal Yakuake.profile" ~/.oh-my-zsh/themes/"MyTerminal Yakuake.profile"
sudo cp configs/MyTerminal.colorscheme ~/.oh-my-zsh/themes/MyTerminal.colorscheme
sudo cp configs/MyTerminal.profile ~/.oh-my-zsh/themes/MyTerminal.profile

# Config Yakuake Profile
if grep -q "DefaultProfile" ~/.config/yakuakerc; then
    sed -i 's/DefaultProfile=.*/DefaultProfile=MyTerminal Yakuake.profile/' ~/.config/yakuakerc
else
    if grep -q "[Desktop Entry]" ~/.config/yakuakerc; then
        sed -i '/\[Desktop Entry\]/d' ~/.config/yakuakerc
        sed -i '/\[Desktop Entry\]/a DefaultProfile=MyTerminal Yakuake.profile' ~/.config/yakuakerc
        sed -i '$a[Desktop Entry]\nDefaultProfile=MyTerminal Yakuake.profile' ~/.config/yakuakerc
    fi
fi

# Switch the shell.
chsh -s $(which zsh)
