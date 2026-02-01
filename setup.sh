#!/bin/bash

# ==========================================
# Self Hosted Git Server Setup Script
# Author: Adinath Phad
# ==========================================

echo "===== Step 1: Install Git on Linux ====="
sudo apt update
sudo apt install git -y


echo "===== Step 2: Create dedicated git user ====="
sudo adduser git


echo "===== Step 3: Generate SSH keys (manual step) ====="
echo "Run these commands manually:"
echo "ssh-keygen"
echo "ssh-copy-id git@localhost"


echo "===== Step 4: Create bare repository on server ====="
su - git -c "mkdir -p repos && cd repos && git init --bare project.git"


echo "===== Step 5: Initialize local repository ====="
mkdir -p myproject
cd myproject
git init


echo "===== Step 6: Commit and push to server ====="
echo "Hello Git Server" > README.md
git add .
git commit -m 'first commit'
git remote add origin /home/git/repos/project.git
git push origin master


echo "===== Step 7: Clone repository to verify ====="
cd ..
git clone /home/git/repos/project.git testclone


echo "===== Setup Complete Successfully ====="
