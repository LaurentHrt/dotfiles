# Dotfiles

## Prerequisites

`bitwarden-cli` must be installed.

## Installation

```sh 
export BW_SESSION=$(bw login $BW_EMAIL --raw)
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

or if chezmoi is already installed: 

```sh 
export BW_SESSION=$(bw login $BW_EMAIL --raw)
chezmoi init --apply $GITHUB_USERNAME
```

## Troubleshooting
### ssh key in bitwarden
The private key must not have any space character.
