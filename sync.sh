#!/bin/bash

# cron job
# 0 9,21 * * * /bin/bash /home/ian/OneDrive/reznov/reznov/sync.sh 2>&1 | while IFS= read -r line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done >> /home/ian/OneDrive/reznov/sync.log


REPO_PATH="/home/ian/OneDrive/reznov/reznov/"
cd "$REPO_PATH" || { echo "Repository path not found! Exiting."; exit 1; }
git stash
git pull origin main || echo "Git pull failed!"
git stash pop || echo "No changes to unstash."

COMMIT_MESSAGE=$(curl -s http://whatthecommit.com/index.txt)

if [ -z "$COMMIT_MESSAGE" ]; then
    COMMIT_MESSAGE=$(date '+%Y-%m-%d %H:%M:%S')
fi

COMMIT_MESSAGE=$(date '+%Y-%m-%d %H:%M:%S')
git add .
git commit -m "$COMMIT_MESSAGE" || echo "Nothing to commit."
git push origin main || echo "Git push failed!"
