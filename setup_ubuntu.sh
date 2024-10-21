dependencies=(
    "tmux"
    "luarocks"
    "fzf"
    "ripgrep"
    "nodejs"
)
install_with_apt() {
    echo "Updating package list..."
    sudo apt update
    for package in "${dependencies[@]}"; do
        echo "Installing $package..."
        sudo apt install -y "$package"
    done
}

# for nodejs
sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh

install_with_apt
