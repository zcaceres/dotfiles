#! /usr/bin/env bash
set -euxo pipefail
VS_CODE_EXTENSIONS_PATH="../vscode/vs-code-extensions.sh"
VS_CODE_SETTINGS_PATH="~/Library/Application Support/Code/User/settings.json"

# OSX defaults
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true

# XCode install
xcode-select --install

# Brew install tools and binaries w/cask
brew update

# Install from Brewfile
brew bundle &

# yarn install some global tools
yarn global add \
serverless \
carbon-now-cli \
serve \
browser- \
gcloud \
netlify-cli \
sequelize \
nodemon \
create-react-app \
serve \
tldr \
typescript \
tsc

# Install latest NodeJS
nvm install node
nvm use node

# Move all config 'root' files to HOME
pushd ../config
cp -r . ~/
popd

# VS Code
# install extensions bundle
cat "$VS_CODE_EXTENSIONS_PATH" | xargs -I _ code --install-extension _
cp ../vscode/settings.json "$VS_CODE_SETTINGS_PATH"

# disables lifecycle scripts on npm install to decrease likelihood of malicious activity when a new package is installed
npm config set ignore-scripts true

# csv command line utility
pip install csvkit
pip install kaggle
conda install -c conda-forge notebook jupyter
