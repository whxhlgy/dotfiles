#!/bin/sh


# some dependencies
sudo apt update
sudo apt install -y gpg
curl https://sh.rustup.rs -sSf | sh # rust and cargo

# [[ constance ]]
CMP_DIR="$HOME/.oh-my-zsh/completions"

# zsh
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing..."
    sudo apt install zsh
fi
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git related
git config --global alias.lol "log --graph --oneline --decorate --color --all"

### INSTALLATION ###
# eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
# zellij
cargo install --locked zellij
mkdir -p $CMP_DIR
zellij setup --generate-completion zsh > $CMP_DIR/_zellij

# config
git clone --separate-git-dir=$HOME/.cfg https://github.com/amazjj/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# zoxide, a cd alternative
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
$HOME/.local/bin/zoxide --cmd cd
# fzf
sudo apt install fzf
# ripgrep
sudo apt install ripgrep
rg --generate complete-zsh > "$CMP_DIR/_rg"
