#!/usr/bin/env bash

tmux display -d 5000 'Installing TPM and plugins'
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/bin/install_plugins
