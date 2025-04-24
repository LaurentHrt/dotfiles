# Dotfiles

## Status

- MacOS: Ok
- Linux:
  - Ubuntu: Ok
  - Ubuntu WSL: Ok
  - Debian: Ok
  - Arch: Ok
- Windows: Ok

## Prerequisites

- git
- curl
- [bitwarden-cli](https://bitwarden.com/help/cli/) (optional if you choose "no" when asked during chezmoi init)

### Mac

- brew

### Windows

- Run `set-executionpolicy remotesigned` in a admin powershell

## Installation

Set up BitWarden env (optional):

```sh
# You are not logged in and log in with an email
export BW_SESSION=$(bw login $BITWARDEN_EMAIL --raw)

# You are already logged in with any method
export BW_SESSION=$(bw unlock --raw)
```

On Linux and Mac:

```sh
REPO_URL=LaurentHrt
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $REPO_URL

# or if chezmoi is already installed:
chezmoi update
chezmoi init --apply $REPO_URL
```

On windows:

```ps1
iex "&{$(irm 'https://get.chezmoi.io/ps1')}"
cd .\bin\
.\chezmoi.exe init --apply $GITHUB_USERNAME

# Fallback in case it does not work
iex "&{$(irm 'https://raw.githubusercontent.com/twpayne/chezmoi/5b48fccda9e8962a92621edfc2395bb2bc3b298a/assets/scripts/install.ps1')}"
# or
choco install chezmoi
```

## Troubleshooting

### ssh key in bitwarden

The private key must not have any space character.

Oneliner to import sshkey in bitwarden :

```sh
echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"sshkey\",\"notes\":\"$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\\\n/g' ~/.ssh/id_rsa)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item
```

## Todo

- Make installation less verbose
- set mac internal setting with script
- set windows internal settings with script
- automatize brew installation
- automatize xcode installation
- add appImageLauncher in linux
- add bitwarden desktop in debian (need app image launcher)
- add gh in debian
