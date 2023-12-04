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
