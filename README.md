# Dotfiles

Works only on macos and partially on linux

## Prerequisites

* bitwarden-cli
* git
* curl
* brew (mac only)

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

Oneliner to import sshkey in bitwarden :
```sh 
echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"sshkey\",\"notes\":\"$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\\\n/g' ~/.ssh/id_rsa)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item
```

## Todo
* Make it work on Linux
* Make it work on windows
