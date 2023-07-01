# Fail on any command.
set -eux pipefail

# Install ZSH
sudo pacman -S -y git zsh curl

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
