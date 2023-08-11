#!/bin/bash

# Set your GitHub email and desired key title
GITHUB_EMAIL="your_email@example.com"
KEY_TITLE="Ubuntu SSH Key"

# Generate SSH key pair
ssh-keygen -t rsa -b 2048 -C "$GITHUB_EMAIL"

# Display public key
echo "Generated public key:"
cat ~/.ssh/id_rsa.pub

# Add SSH key to GitHub
echo "Adding SSH key to GitHub..."
PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub)
curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" -d "{\"title\":\"$KEY_TITLE\",\"key\":\"$PUBLIC_KEY\"}" https://api.github.com/user/keys
echo "SSH key added to GitHub."

# Test SSH connection
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com
