set fish_greeting
function vs --argument-names path
    if test -n "$path"
        code $path
    else
        code .
    end
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


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

# doom cli
set -gx PATH $HOME/.emacs.d/bin $PATH

# go environment
set -x GOPATH ~/development/go
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

set -gx PATH $PATH $HOME/.composer/vendor/bin

set -x PATH $PATH /opt/homebrew/opt/postgresql@16/bin
#rvm
rvm default

fish_config theme choose "Rosé Pine Dawn"

atuin init fish | source
zoxide init fish | source
starship init fish | source
thefuck --alias | source 

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true



set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
