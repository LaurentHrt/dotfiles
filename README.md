# Dotfiles

## Prerequisites

`bitwarden-cli` must be installed.

## Installation

```sh
# You are already logged in with any method
export BW_SESSION=$(bw unlock --raw)
# You are not logged in and log in with an email
export BW_SESSION=$(bw login $BITWARDEN_EMAIL --raw)
```

```sh 
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

or if chezmoi is already installed: 

```sh 
chezmoi init --apply $GITHUB_USERNAME
```

## Troubleshooting
### ssh key in bitwarden
The private key must not have any space character.
