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
alias exa="exa --icons --group-directories-first -hg --git"
alias ls='exa'
alias la='exa -al'
alias lla='exa -al'
alias l='exa -l'
alias lt='exa -T --git-ignore --level=2 --group-directories-first'
alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
alias llat='exa -alT --git-ignore --level=2 --group-directories-first'
alias lT='exa -T --git-ignore --level=4 --group-directories-first'
# alias backup-dot-files='(cd ~/workspace/personal/my-dotfiles && ./backup.sh)'
# alias vim=nvim
alias vi=nvim
alias pdm=podman
alias pdmms='podman machine stop'
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
alias n='nnn -de'

# tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
