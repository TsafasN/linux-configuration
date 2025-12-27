#!/bin/bash

echo "=== GitLab Token Setup ==="

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y libsecret-1-0 libsecret-1-dev libsecret-common libsecret-tools

echo ""
echo "Please store your GitLab token:"
echo ""
echo "Option 1: Use secret-tool Interactively to let secret-tool prompt you"
echo "Manual step required:"
echo "Run: secret-tool store --label='GitLab Personal Access Token' application gitlab"
echo "Then enter your token when prompted"
echo ""
echo "Option 2: Alternatively, you can run the following command and pipe your token into it:"
echo "echo -n 'your_password' | secret-tool store --label='GitLab Personal Access Token' application gitlab"
# secret-tool store --label='GitLab Personal Access Token' application gitlab
# echo -n "password" | secret-tool store --label='GitLab Personal Access Token' application gitlab

# Test: secret storage by quering the attribute
secret-tool search --all application gitlab

# Add environment variable to bashrc
echo 'export GITLAB_TOKEN=$(secret-tool lookup application gitlab)' >> ~/.bashrc

# Reload bashrc to apply changes
source ~/.bashrc

# Test: environment variable by echoing it
echo $GITLAB_TOKEN
