#! /usr/bin/env bash
set -euxo pipefail
EXTENSIONS_PATH="./vs-code-extensions.sh"

# XCode install
xcode-select --install

# Brew install tools and binaries w/cask
brew update

# Install from Brewfile
brew bundle

# yarn install some global tools
yarn global add nodemon serverless carbon-now-cli create-react-app sequelize serverless serve browser-sync gcloud netlify-cli eslint tldr

# Install latest NodeJS
nvm install node
nvm use node

# Move all config 'root' files to HOME
for filename in ./root_files; do
    [ -e "$filename" ] || continue
    cp ./root_files/"$filename" ~/"$filename"
done

# install VS Code extensions bundle
bash "$EXTENSIONS_PATH"

# disables lifecycle scripts on npm install to decrease likelihood of malicious activity when a new package is installed
npm config set ignore-scripts true

