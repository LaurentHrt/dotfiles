#!/bin/zsh
#MISE description="Script to apply chezmoi after unlocking bitwarden"

if ! command -v bw >/dev/null 2>&1 || ! bw --version >/dev/null 2>&1; then
  echo 'bitwarden-cli must be installed and runnable to run this script. Aborting.'
  return
fi

BW_STATUS=$(bw status | jq -r '.status')
if [[ "$BW_STATUS" == "unlocked" ]]; then
  echo "Bitwarden is already unlocked, applying changes..."
elif [[ "$BW_STATUS" == "locked" ]]; then
  echo "Bitwarden is locked."
  if ! bw sync; then
    echo "Warning: Bitwarden sync failed (network or TLS issue). Continuing without sync."
  fi
  export BW_SESSION=$(bw unlock --raw)
  # Check if bw unlock was successful
  if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
      echo "Failed to unlock Bitwarden. Exiting."
      return
  fi
  echo "Session unlocked, applying changes..."
else
  echo "Bitwarden is unauthenticated."

  echo -n "Enter your password: "
  read -s PASSWORD
  echo

  export PASSWORD

  bw login laurent.hirth.68@icloud.com --passwordenv PASSWORD 1>/dev/null
  export BW_SESSION=$(bw unlock --passwordenv PASSWORD --raw)

  unset PASSWORD

  # Check if bw unlock was successful
  if [[ $(bw status | jq -r '.status') != "unlocked" ]]; then
      echo "Failed to unlock Bitwarden. Exiting."
      return
  fi
  echo "Session unlocked, applying changes..."
fi
chezmoi update
echo "Changes applied by chezmoi."
bw lock

