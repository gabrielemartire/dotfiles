set fish_greeting
set TERM xterm-256color
set EDITOR nano

# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
fish_add_path -m $HOME/.bin $HOME/.local/bin /usr/local/bin $fish_user_paths

set PNPM_HOME $HOME/Library/pnpm

if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

set os $(uname | tr '[:upper:]' '[:lower:]')

if [ "$os" = darwin ]
    fish_add_path /opt/homebrew/bin /opt/homebrew/opt
    fish_add_path /opt/homebrew/opt/openjdk@17/bin $fish_user_paths
    fish_add_path /opt/homebrew/opt/openssl@1.1/bin
end

fish_add_path $PNPM_HOME $HOME/.yarn/bin $fish_user_paths

alias reload='source $HOME/.config/fish/config.fish'

alias la='ls -la'

if [ "$os" = darwin ]
    alias b='brew'
    alias bi='brew install'
    alias bic='brew install --cask'
    alias bu='brew update'
    alias bup='brew upgrade'
    alias bo='brew outdated'
end

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gld='git log --pretty=format:\'%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s\''

alias ls='lsd'

alias cat='bat'

alias pn='pnpm'
alias pni='pnpm install'
alias pnd='pnpm run dev'
alias pns='pnpm run start'

alias nrd='npm run dev'

fzf --fish | source

mise activate fish | source

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

starship init fish | source