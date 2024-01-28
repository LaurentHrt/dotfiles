alias sudo='sudo '
alias c="clear"
alias q="exit"
# alias h="history"
alias ws="webstorm"
alias edit="open -e"
alias cat='bat'
alias als='alias | grep'
alias cd='z'
alias omzr='omz reload'
alias aliasedit='nvim ~/.config/.oh-my-zsh/custom/custom-aliases.zsh'
alias editalias='aliasedit'
alias zshconfig='nvim ~/.zshrc'
# alias gita='python3 -m gita'
alias j='jobs'
alias pm='pm2'
alias pml='pm2 list --sort id'
alias pmlg='pm2 logs'
alias pmevodev='pm2 start ~/workspace/sidel/evoon-pm.config.js'
alias pmsa='pm2 stop all'
alias sshraspi='ssh laurent@192.168.10.21 -p 22001 -i ~/.ssh/id_ed25519.raspi'
alias raspissh='sshraspi'
alias sshraspiw='ssh laurent@jupiter3.duckdns.org -p 22001 -i ~/.ssh/id_ed25519.raspi'
alias eza="eza --icons --group-directories-first -hg --git"
alias ls='eza'
alias la='eza -al'
alias lla='eza -al'
alias l='eza -l'
alias lt='eza -T --git-ignore --level=2 --group-directories-first'
alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
alias llat='eza -alT --git-ignore --level=2 --group-directories-first'
alias lT='eza -T --git-ignore --level=4 --group-directories-first'
# alias backup-dot-files='(cd ~/workspace/personal/my-dotfiles && ./backup.sh)'
# alias vim=nvim
alias v=nvim
alias rip='rip --graveyard ~/.Trash/'
alias wrapon='tput rmam'
alias wrapoff='tput smam'
# alias rm='rm -i'
alias npr='npm run'
alias nprd='nvm use; npm run dev'
alias nvmu='nvm use'
alias d="cd"

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

# Komportementalist
alias sshvmstage='ssh root@34.65.74.225 -i ~/workspace/komportementalist/vm_staging_key'
alias sshvmprod='ssh root@34.155.121.82 -i ~/workspace/komportementalist/vm_prod_key'
alias checkvmprod="sshvmprod 'docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.RunningFor}}\"'"
alias checkvmstage="sshvmstage 'docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.RunningFor}}\"'"

# Github
alias gpl="gh pr list"

# Git 
alias deletemerged="git branch --merged | egrep -v '(^\*|master|main|developpement)' | xargs git branch -d"
alias lg="lazygit"
