#!/bin/bash

echo "Installing Ansible..."
apt-get install -y python-pip python-dev
pip install ansible==1.9.2
mkdir -p /etc/ansible
touch /etc/ansible/hosts