dependencies=(
    "tmux"
    "luarocks"
    "fzf"
    "ripgrep"
    "node"
)
install_with_brew() {
    if ! command_exists brew; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    for package in "${dependencies[@]}"; do
        echo "Installing $package..."
        brew install "$package"
    done
}

install_with_brew
