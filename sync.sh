#!/bin/bash

REPO_PATH="/home/ian/OneDrive/reznov/reznov/"
cd "$REPO_PATH" || { echo "Repository path not found! Exiting."; exit 1; }
git stash
git pull origin main || echo "Git pull failed!"
git stash pop || echo "No changes to unstash."
COMMIT_MESSAGE=$(date '+%Y-%m-%d %H:%M:%S')
git add .
git commit -m "$COMMIT_MESSAGE" || echo "Nothing to commit."
git push origin main || echo "Git push failed!"
