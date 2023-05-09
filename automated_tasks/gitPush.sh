#!/bin/bash

commit_message="$1"

# Add and commit changes
git add .
git commit -m "$commit_message"

# Push changes
if git push 2>&1 | grep -q "Everything up-to-date"; then
  echo -e "\n\n======== feedback from script ========\n** Nothing to push. it's up-to-date! **\n"
  exit 0
elif git push 2>&1 | grep -q "error: failed to push some refs"; then
  echo -e "\n*** Remote contains work that you do not have locally ***"
  echo -e "\nAttempting to pull changes from remote..."

  # Try to merge remote changes
  if git pull --ff-only; then
    echo -e "\n** Successfully pulled remote changes **"
    git push
    echo -e "\n*** Successfully pushed changes to remote ***"
  else
    echo -e "\nMerge conflict. Please resolve conflicts and push changes manually."
  fi
else
  echo -e "\n*** Successfully pushed to Github***"
fi
