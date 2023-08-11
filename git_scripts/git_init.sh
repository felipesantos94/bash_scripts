#!/bin/bash

# Set your GitHub username, repository name, and branch name
GITHUB_USERNAME="your_username"
REPO_NAME="your-repo"
BRANCH_NAME="main"

# Create a new directory for the project
mkdir $REPO_NAME
cd $REPO_NAME

# Initialize Git repository
git init

# Create and add some files to the repository
echo "Hello, World!" > README.md
git add README.md

# Make the first commit
git commit -m "Initial commit"

# Create a new repository on GitHub (using GitHub API)
echo "Creating repository on GitHub..."
RESPONSE=$(curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" -d "{\"name\":\"$REPO_NAME\"}" https://api.github.com/user/repos)
REMOTE_URL=$(echo "$RESPONSE" | jq -r '.ssh_url')
echo "GitHub repository created: $REMOTE_URL"

# Add the remote repository and push the branch
git remote add origin $REMOTE_URL
git branch -M $BRANCH_NAME
git push -u origin $BRANCH_NAME

echo "First commit pushed to GitHub."