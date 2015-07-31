#!/bin/bash                                                                                                                                                                                                                                   
set -o errexit
set -o nounset

GITBRANCH=$(git branch 2>/dev/null | sed -n 's/^\*\ //p')
UPSTREAM=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
NUMBER_OF_COMMITS="$1"

if [ -z "$GITBRANCH" ]; then
  echo "No git branch found"
  exit 1
fi
if [ -z "$UPSTREAM" ]; then
  echo "No upstream found"
  exit 1
fi
if [ -z "$NUMBER_OF_COMMITS" ]; then
  NUMBER_OF_COMMITS=1
fi
if (( NUMBER_OF_COMMITS < 0 )); then
  echo "Invalid number of commits: $NUMBER_OF_COMMITS. Must be a positive number"
  exit 1
fi

git rebase --onto $UPSTREAM $GITBRANCH~$NUMBER_OF_COMMITS $GITBRANCH