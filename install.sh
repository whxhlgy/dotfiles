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
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz
rm lazygit
# kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# tmux
sudo apt install tmux -y
# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# neovim
cargo install bob-nvim
bob install stable
ln -s ~/.local/share/bob/nightly/bin/nvim ~/.local/bin/nvim
sudo apt install luarocks # for neorg
