alias sudo='sudo '
alias c="clear"
alias q="exit"
alias ws="webstorm"
alias edit="open -e"
alias cat='bat'
alias als='alias | grep'
alias omzr='omz reload'
alias aliasedit='nvim ~/.config/custom-aliases.zsh'
alias editalias='aliasedit'
alias zshconfig='nvim ~/.zshrc'
alias j='jobs'
alias pm='pm2'
alias pml='pm2 list --sort id'
alias pmlg='pm2 logs'
alias pmsa='pm2 stop all'
alias eza="eza --icons --group-directories-first -hg --git"
alias ls='eza'
alias la='eza -al'
alias lla='eza -al'
alias l='eza -l'
alias lt='eza -T --git-ignore --level=2 --group-directories-first'
alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
alias llat='eza -alT --git-ignore --level=2 --group-directories-first'
alias lT='eza -T --git-ignore --level=4 --group-directories-first'
alias v=nvim
alias rip='rip --graveyard ~/.Trash/'
alias wrapon='tput rmam'
alias wrapoff='tput smam'
alias npr='npm run'
alias nprd='nvm use; npm run dev'
alias nvmu='nvm use'
alias d="cd"
alias ..="cd .."

# Create a Brewfile file backup
alias brewBackup="(cd ~/.config && rm Brewfile && brew bundle dump)"
 
# Helm
alias h="helm"
alias hin="helm install"
alias hse="helm search"
alias hup="helm upgrade"
alias hun="helm uninstall"

# fnm nvm
alias nvm="fnm"

# fuzzy
alias vf='nvim $(fzf)'

# nnn
alias n='nnn -e'

# tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'

# GCP
alias gcloudloglast='gcloud builds log --stream $(gcloud builds list --ongoing --format=yaml | yq '.id' | head -n 1)'

# Github
alias gpl="gh pr list"

# Git 
alias deletemerged="git branch --merged | egrep -v '(^\*|master|main|developpement)' | xargs git branch -d"
alias lg="lazygit"
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gsw="git switch"
alias gcam="git commit --all --message"
alias gcm="git commit --message"
alias gc!="git commit --amend"
alias gca!="git commit --all --amend"
alias gst="git status"
alias gf="git fetch"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias grs="git restore"
