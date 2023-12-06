set fish_greeting

# alias
alias c="clear"
# alias coding="cd $HOME/coding"
alias ls="exa"
alias vi="nvim"
alias prv="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias gitconfig set_work_git_config

function set_work_git_config
    git config user.name phonglenus
    git config user.email "hongphongle115@gmail.com"

    echo "Git user configured for the project"

end

function vs --argument-names path
    if test -n "$path"
        code $path
    else
        code .
    end
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<


# go environment
set -x GOPATH ~/development/go
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

set -gx PATH $PATH $HOME/.composer/vendor/bin

#rvm
rvm default
