# Usage

this is a bare git repo for my personal config files

## steps

first copy the actual content of repo to your HOME dir

```
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare https://github.com/whxhlgy/dotfiles.git $HOME/.cfg
cfg checkout
```

do some config:
`cfg config --local status.showUntrackedFiles no`

install some cli tools:
`bash setuplet.sh`
