export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Display my name instead of my computername
export DEFAULT_USER="$(whoami)"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git 
themes 
zsh-syntax-highlighting 
zsh-autosuggestions
vscode
) 

source $ZSH/oh-my-zsh.sh

alias mv="mv -i" 
alias v="nvim"

# autojump plugin
[[ -s /Users/zhongjunjie/.autojump/etc/profile.d/autojump.sh ]] && source /Users/zhongjunjie/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
# VIM
export VIM_HOME=$(which vim)
export PATH=$VIM_HOME:$PATH
export EDITOR=vim
export PATH="/usr/local/bin:$PATH"
export VIMRUNTIME="/usr/local/Cellar/neovim/0.8.2/share/nvim/runtime"
export CC="/usr/local/bin/gcc-13"
# VIM End
#
# MacVim
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
# g++11
alias g++="g++ -std=c++11"
# nvim
alias vim="nvim"

# lvim
export PATH="$HOME/.local/bin:"$PATH

# neovide 
export NEOVIDE_FRAME="buttonless"
export NEOVIDE_MULTIGRID=true

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
