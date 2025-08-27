# Dotfiles

## Status

- MacOS: Ok
- Linux:
  - Ubuntu: Ok
  - Debian: Ok
  - Arch: Ok
- Windows: Ok
- Windows WSL:
  - Ubuntu: Ok
  - Debian: WIP

## Prerequisites

### Mac & Linux

- git
- curl
- wget
- gpg
- unzip
- [bitwarden-cli](https://bitwarden.com/help/cli/) (optional if you choose "no" when asked during chezmoi init)
- brew (Mac only)

```sh
sudo apt install git curl wget gpg unzip
```

### Windows

- Run `set-executionpolicy remotesigned` in a admin powershell
- Run `set-executionpolicy unrestricted process` in a admin powershell

## Installation

### Set up BitWarden env (optional)

```sh
# You are not logged in and log in with an email
export BW_SESSION=$(bw login $BITWARDEN_EMAIL --raw)

# You are already logged in with any method
export BW_SESSION=$(bw unlock --raw)
```

### On Linux and Mac

```sh
REPO_URL=LaurentHrt
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $REPO_URL

# or if chezmoi is already installed:
chezmoi update
chezmoi init --apply $REPO_URL
```

### On windows

#### Chezmoi installation

```ps1
iex "&{$(irm 'https://get.chezmoi.io/ps1')}"

# Fallback in case it does not work
iex "&{$(irm 'https://raw.githubusercontent.com/twpayne/chezmoi/5b48fccda9e8962a92621edfc2395bb2bc3b298a/assets/scripts/install.ps1')}"
# or
choco install chezmoi
```

#### Chezmoi initialization

```
cd .\bin\
.\chezmoi.exe init --apply $GITHUB_USERNAME
```

#### If Chezmoi initialization does not work

```
.\chezmoi.exe cd
git remote add origin https://github.com/LaurentHrt/dotfiles.git
git pull
.\chezmoi.exe init --apply

```

## Troubleshooting

### ssh key in bitwarden

The private key must not have any space character.

Oneliner to import sshkey in bitwarden :

```sh
echo "{\"organizationId\":null,\"folderId\":null,\"type\":2,\"name\":\"sshkey\",\"notes\":\"$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\\\n/g' ~/.ssh/id_rsa)\",\"favorite\":false,\"fields\":[],\"login\":null,\"secureNote\":{\"type\":0},\"card\":null,\"identity\":null}" | bw encode | bw create item
```

## Todo

- Detect the architecture (x86 or arm) for software installation like neovim (or ask the architecture before apply ?)
- Make installation less verbose
- set mac internal setting with script
- set windows internal settings with script
- automatize brew installation
- automatize xcode installation
- add appImageLauncher in linux
- add bitwarden desktop in debian (need app image launcher)
- add gh in debian
