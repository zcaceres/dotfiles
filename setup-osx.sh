#! /usr/bin/env bash
set -euxo pipefail

./scripts/install-homebrew.sh

brew install ansible

# Install ansible collections
ansible-galaxy collection install community.general

# Run ansible playbook locally
ansible-playbook -i ./ansible/inventory ./ansible/site.yml -c local
