#!/bin/sh

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

############################
########## CORE ############
############################

# zsh
if ! command_exists zsh; then
    echo "Zsh is not installed. Installing..."
    sudo apt install zsh -y
fi
# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k

# tpm(tmux package manager)
# <C-a> + I to install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
if ! command_exists nvim; then
    echo "neovim not installed, installing..."
    curl https://sh.rustup.rs -sSf | sh # rust and cargo
    cargo install bob-nvim
    bob install nightly
    ln -s ~/.local/share/bob/nightly/bin/nvim ~/.local/bin/nvim
fi

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

if [[ $OSTYPE == "darwin"* ]]; then
    source ~/setup_mac.sh
elif [[ $OSTYPE == "linux-gnu"* ]]; then
    source ~/setup_ubuntu.sh
fi
