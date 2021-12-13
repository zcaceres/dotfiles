#! /usr/bin/env bash

apt install ack nodejs npm htop iftop tldr locate wget xsel trash-cli zeal ghostwriter hunspell-en-us

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

apt install bat
echo 'If bat did not install, you must visit the release page and instal with
dpkg: https://github.com/sharkdp/bat/releases'

echo 'Installing typescript syntax for vim'
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

