
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/dimanu/miniconda3/bin/conda
    eval /Users/dimanu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# Add HomeBrew's bin directory to path
fish_add_path "/opt/homebrew/bin/"

# Alias
alias frenetic="conda activate frenetic"
alias venv="conda activate engine"
alias jj="frenetic & jupyter notebook"
alias api="cd /Users/dimanu/Developer/api-frenetic"
alias marai="cd /Users/dimanu/Developer/MARAI"
alias engine="cd /Users/dimanu/Developer/engine-frenetic"
alias web="cd /Users/dimanu/Developer/web-frenetic"
alias dev="cd /Users/dimanu/Developer"
alias lah="ls -lah"
alias dwb="docker-compose exec -it --user=laradock workspace bash"
alias grep="grep --color=auto"
alias cat="bat --style=plain --paging=never"
alias ls="exa --group-directories-first"
alias tree="exa -T"
alias lsa="ls -la"

starship init fish | source
fzf --fish | source
