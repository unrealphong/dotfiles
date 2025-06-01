# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    docker
)

source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# path alias
export WORKSPACE=~/workspace
export DEVELOPMENT=~/development

# go env
export GOPATH=$DEVELOPMENT/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# llvm env
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# postgresql
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# nvm env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# deno
export PATH="/Users/lehongphong/.deno/bin:$PATH"

# shell eval
# eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Angular CLI autocompletion.
source <(ng completion script)

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/lehongphong/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# alias
alias wtf3000="lsof -i tcp:3000"
