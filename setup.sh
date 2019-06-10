#! /bin/bash
EXTENSIONS_PATH="./vs-code-extensions.sh"

# Brew install tools and binaries w/cask
brew update
brew install hub node nvm redis hugo npm yarn ffmpeg parallel ack
brew cask install anaconda rescuetime private-internet-access cloudapp postico postgres flux postman visual-studio-code obs anki skype slack notion hyper steam docker kindle spotify google-chrome firefox trello unity

# yarn install some global tools
yarn global nodemon serverless ngrok carbon-now

# XCode install
xcode-select --install

# Move all config files to home
for filename in ./root_files; do
    [ -e "$filename" ] || continue
    cp ./root_files/"$filename" ~/"$filename"
done

# install VS Code extensions bundle
bash "$EXTENSIONS_PATH"


