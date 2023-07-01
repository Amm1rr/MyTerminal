# Fail on any command.
set -eux pipefail

# Install Powerline for VIM.
sudo pacman -S python-pip
pip3 install --user powerline-status
sudo cp configs/.vimrc ~/.vimrc

# Install Patched Fonts
mkdir ~/.fonts
sudo cp -a fonts/. ~/.fonts/
fc-cache -vf ~/.fonts/
