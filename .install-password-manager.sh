#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
if type bw > /dev/null 2>&1; then
  echo 'info: password manager is already installed'
    echo "Bitwarden login:"
    BW_STATUS=$(bw status | jq -r '.status')
    if [[ "$BW_STATUS" == "locked" ]]; then
      echo "Bitwarden is locked."
      export BW_SESSION=$(bw unlock --raw)
      # Check if bw unlock was successful
      if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
          echo "Failed to unlock Bitwarden. Exiting."
          return
      fi
    elif [[ "$BW_STATUS" == "unlocked" ]]; then
      echo "Bitwarden is already unlocked, applying changes..."
    else
      echo "Bitwarden is unauthenticated, please authenticate:"
      bw login
      export BW_SESSION=$(bw unlock --raw)
      # Check if bw unlock was successful
      if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
          echo "Failed to unlock Bitwarden. Exiting."
          return
      fi
    fi
    echo "Session unlocked, applying changes..."
  exit
else
    echo "Installing password manager"
fi


case "$(uname -s)" in
Darwin)
    brew install bitwarden-cli
    echo "Bitwarden login:"
    BW_STATUS=$(bw status | jq -r '.status')
    if [[ "$BW_STATUS" == "locked" ]]; then
      echo "Bitwarden is locked."
      export BW_SESSION=$(bw unlock --raw)
      # Check if bw unlock was successful
      if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
          echo "Failed to unlock Bitwarden. Exiting."
          return
      fi
    elif [[ "$BW_STATUS" == "unlocked" ]]; then
      echo "Bitwarden is already unlocked, applying changes..."
    else
      echo "Bitwarden is unauthenticated, please authenticate:"
      bw login
      export BW_SESSION=$(bw unlock --raw)
      # Check if bw unlock was successful
      if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
          echo "Failed to unlock Bitwarden. Exiting."
          return
      fi
    fi
    echo "Session unlocked, applying changes..."
    ;;
Linux)
    DISTRIBUTION=$(cat /etc/os-release | grep '^ID=' | cut -d'=' -f2)
    case "$DISTRIBUTION" in
        arch)
            pacman -S bitwarden-cli
            ;;
        ubuntu | debian)
            sudo apt install curl unzip git
            curl -L "https://vault.bitwarden.com/download/?app=cli&platform=linux" -o bw.zip
            unzip bw.zip -d ~/.local/bin/
            rm bw.zip
            ;;
        *)
            echo "Unsupported distribution $DISTRIBUTION"
            ;;
    esac
    ;;
*)
    echo "Unsupported OS $(uname -s)"
    exit 1
    ;;
esac
