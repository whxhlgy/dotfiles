
# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH=/usr/local/bin/python3:${PATH}
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting alias for brew between arm64 and x86
alias abrew='arch -arm64 /opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
eval "$(/opt/homebrew/bin/brew shellenv)"
