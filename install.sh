# Fail on any command.
set -eux pipefail

sh -c ./install_powerline.sh
sh -c ./install_terminal.sh
sh -c ./install_profile.sh
