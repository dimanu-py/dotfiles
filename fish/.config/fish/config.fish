# Path variation
set -U fish_user_paths $fish_user_paths /home/dimanu/.local/bin

# Custom greeting
source /home/dimanu/.config/fish/functions/fish_greet.fish
set -g fish_greeting

# Alias
alias dev="cd /home/dimanu/Developer"
alias lah="ls -lah"
alias dwb="docker-compose exec -it --user=laradock workspace bash"
alias grep="grep --color=auto"
alias cat="bat --style=plain --paging=never"
alias ls="exa --group-directories-first"
alias tree="exa -T"
alias grep="grep --color=auto"
alias cd="z"
alias ga="git add"
alias gm="git commit -m"
alias gs="git status"

# Set up programs
starship init fish | source
fzf --fish | source
zoxide init fish | source
pyenv init - | source
