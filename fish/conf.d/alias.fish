alias ls eza 
alias l "ls -lah"
alias la "ls -lAh"
alias ll "ls -lh"

alias vim nvim
alias c "clear"
alias vsc "code ."
alias prv "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias gitconfig set_work_git_config

function set_work_git_config
    git config user.name "henryy-el" 
    git config user.email "phonghngle@gmail.com" 

    echo "Git user configured for the project"

end


