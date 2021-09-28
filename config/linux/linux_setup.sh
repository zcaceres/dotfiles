#! /usr/bin/env bash

apt install ack nodejs npm htop iftop tldr wget xsel trash-cli zeal

echo 'installing Rust'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo 'Checking node-js version:'
node -v

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 16

nvm use 16

npm installl --global yarn

echo 'Install VSCode: https://code.visualstudio.com/docs/setup/linux'

echo 'Install PIA: https://www.privateinternetaccess.com/pages/changelog'
