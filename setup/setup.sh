#! /usr/bin/env bash
set -euxo pipefail
VS_CODE_EXTENSIONS_PATH="../.vscode/vs-code-extensions.sh"
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
brew bundle

# yarn install some global tools
yarn global add nodemon serverless carbon-now-cli create-react-app sequelize serverless serve browser-sync gcloud netlify-cli eslint tldr puppeteer gatsby-cl parcel-bundler typescript expo-cli tsc

# Install latest NodeJS
nvm install node
nvm use node

# Move all config 'root' files to HOME
for filename in ../config; do
    [ -e "$filename" ] || continue
    cp ../config/"$filename" ~/"$filename"
done

# VS Code
# install extensions bundle
bash "$VS_CODE_EXTENSIONS_PATH"
cp ../vscode/settings.json "$VS_CODE_SETTINGS_PATH"

# disables lifecycle scripts on npm install to decrease likelihood of malicious activity when a new package is installed
npm config set ignore-scripts true

# csv command line utility
pip install csvkit
pip install kaggle
conda install -c conda-forge notebook jupyter
