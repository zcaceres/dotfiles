#! /usr/bin/bash

# Install Ansible
sudo apt install -y ansible sshpass

# Get Ansible community blocks
ansible-galaxy collection install community.general

# Run Ansible Playbook
ansible-playbook -i ./ansible-linux/inventory ./ansible-linux/site.yml -c local

