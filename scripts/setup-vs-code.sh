#! /usr/bin/env bash
set -euxo pipefail
VS_CODE_EXTENSIONS_PATH="../vscode/vs-code-extensions.sh"
VS_CODE_SETTINGS_PATH="~/Library/Application Support/Code/User/settings.json"
VS_CODE_KEYBINDINGS_PATH="~/Library/Application Support/Code/User/keybindings.json"

# install extensions bundle
cat "$VS_CODE_EXTENSIONS_PATH" | xargs -I _ code --install-extension _
cp ../vscode/settings.json "$VS_CODE_SETTINGS_PATH"
cp ../vscode/keybindings.json "$VS_CODE_KEYBINDINGS_PATH"

