# Dotfiles

## Status
MacOS: Ok
Linux (including WSL): 
 - Ubuntu: Ok
 - Debian: Ok
Windows: wip

## Prerequisites

* bitwarden-cli (https://bitwarden.com/help/cli/) (optional if you choose "no" when asked during chezmoi init)
* git
* curl
* brew (mac only)
* chocolatey (windows only)

## Installation

Set up BitWarden env (optional)
```sh
# You are not logged in and log in with an email
export BW_SESSION=$(bw login $BITWARDEN_EMAIL --raw)
# You are already logged in with any method
export BW_SESSION=$(bw unlock --raw)
```

Install config
```sh 
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
# or if chezmoi is already installed:
chezmoi init --apply $GITHUB_USERNAME
```

## Troubleshooting
### ssh key in bitwarden
The private key must not have any space character.

Oneliner to import sshkey in bitwarden :
```sh 
echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"sshkey\",\"notes\":\"$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\\\n/g' ~/.ssh/id_rsa)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item
```

## Todo
* Make it work on windows
  - create a ps1 file to install packages with choco
* set mac internal setting with script
* set windows internal settings with script
