#!/bin/sh

dependencies=(
    "fish"
    "tmux"
    "luarocks"
    "fzf"
    "ripgrep"
    "node"
    "zsh-syntax-highlighting"
    "zsh-autosuggestions"
    "powerlevel10k"
)

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

install_with_apt() {
    echo "Updating package list..."
    sudo apt update
    for package in "${dependencies[@]}"; do
        echo "Installing $package..."
        sudo apt install -y "$package"
    done
}

install_with_brew() {
    if ! command_exists brew; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    for package in "${dependencies[@]}"; do
        echo "Installing $package..."
        brew install "$package"
    done
}

############################
########## CORE ############
############################

# zsh
if ! command_exists zsh; then
    echo "Zsh is not installed. Installing..."
    sudo apt install zsh -y
fi

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

# set default shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
