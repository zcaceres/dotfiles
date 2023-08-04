#! /usr/bin/env bash
set -euxo pipefail

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to path
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Ansible and GitHub CLI
brew install ansible
brew install gh

# Install Ansible collections
ansible-galaxy collection install community.general --timeout 60

# Run Ansible playbook locally
ansible-playbook -vvv -i ./ansible-osx/inventory ./ansible-osx/site.yml -c local
