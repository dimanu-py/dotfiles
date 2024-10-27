# Path variation
set -U fish_user_paths $fish_user_paths /home/dmartinez/.local/bin

# Alias
alias dev="cd /home/dmartinez/Developer"
alias lah="ls -lah"
alias dwb="docker-compose exec -it --user=laradock workspace bash"
alias grep="grep --color=auto"
alias cat="batcat --style=plain --paging=never"
alias ls="exa --group-directories-first"
alias tree="exa -T"
alias grep="grep --color=auto"
alias cd="z"
alias ga="git add"
alias gm="git commit -m"
alias gs="git status"

# Set up programs
starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source
fzf --fish | source
zoxide init fish | source
pyenv init - | source
