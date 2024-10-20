#!/bin/sh

dependencies=(
    "tmux"
    "luarocks"
    "fzf"
    "ripgrep"
    "node"
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
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plggins (manually install)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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

# p10k(use oh-my-zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install other cli tools
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install_with_apt
elif [[ "$OSTYPE" == "darwin"* ]]; then
    install_with_brew
fi

# tmux theme
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
