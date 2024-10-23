dependencies=(
    "tmux"
    "luarocks"
    "fzf"
    "ripgrep"
    "node"
    "lazygit"
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

# install lua5.1
curl https://www.lua.org/ftp/lua-5.1.5.tar.gz > lua-5.1.5.tar.gz
tar xzf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
mkdir ~/opt
make INSTALL_TOP=$HOME/opt/lua@5.1 install
mkdir -p ~/.local/bin
ln -s ~/opt/lua@5.1/bin/lua ~/.local/bin/lua5.1
cd -
rm -rf lua-5.1.5.tar.gz
rm -rf lua-5.1.5

install_with_brew
