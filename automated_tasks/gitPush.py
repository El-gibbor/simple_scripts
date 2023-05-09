#!/usr/bin/env python3

import subprocess as sp
import sys

commit_message = sys.argv[1]

# Check if there are any changes to commit
# status_output = sp.check_output(["git", "status", "--porcelain"], text=True)
# if not status_output.strip():
#     print("No changes to commit. Exiting..")
#     sys.exit(0)

# Add and commit changes
sp.run(["git", "add", "."], check=True)
sp.run(["git", "commit", "-m", commit_message], check=True)

# Push changes
try:
    push_output = sp.check_output(["git", "push"], stderr=sp.STDOUT, text=True)
    if " ! [rejected]" in push_output:
        print("local changes found")
    if "Everything up-to-date" in push_output:
        print("\n\n======== feedback from script ========\n**\
            Nothing to push. it's up-to-date! **\n")
    else:
        print("\n\n======== feedback from script ========")
        print("\n*** Successfully pushed to Github ***")
except sp.CalledProcessError as e:
    push_output = e.output
    if "error: failed to push some refs" in push_output:
        print("\n*** Remote contains work that you do not have locally ***")
        print("\nAttempting to pull changes from remote...")
        try:
            sp.run(["git", "pull", "--ff-only"], check=True)
            print("\n** Successfully pulled remote changes **")
            sp.run(["git", "push"], check=True)
            print("\n*** Successfully pushed changes to remote ***")
        except sp.CalledProcessError:
            print("\nMerge conflict. Please resolve conflicts\
                and push changes manually.")
    else:
        print(f"\nError pushing to Github: {push_output}", file=sys.stderr)
