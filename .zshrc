# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
docker
docker-compose
) 

source $ZSH/oh-my-zsh.sh

##############
### CUSTOM ###
##############

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/mysql-client/bin/:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias notes='vim -c "Neorg workspace notes"'

################
##### VIM ######
################

alias vim="nvim"
export VIM_HOME=$(which vim)
export CC=/usr/bin/clang-18
export EDITOR=nvim

################
##### PATH #####
################
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/junjiezh/bin:$PATH"
export FPATH="/home/junjiezh/me/eza/completions/zsh:$FPATH"

###############
## CLI TOOLS ##
###############
eval "$(zoxide init zsh)"


