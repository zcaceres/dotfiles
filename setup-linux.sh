#! /usr/bin/env bash
set -euxo pipefail

# Check if Ansible is installed
if ! command -v ansible &>/dev/null; then
    # Update apt and install Ansible and sshpass
    sudo apt-get update
    sudo apt-get install -y ansible sshpass
fi

# Install Ansible collections
ansible-galaxy collection install community.general --timeout 60

# Run Ansible playbook locally
ansible-playbook -vvv -i ./ansible-linux/inventory ./ansible-linux/site.yml -c local
