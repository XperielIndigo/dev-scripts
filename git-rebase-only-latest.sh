#!/bin/bash                                                                                                                                                                                                                                   
set -o errexit
set -o nounset

pwd

GITBRANCH=$(git branch 2>/dev/null | sed -n 's/^\*\ //p')
UPSTREAM=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
if [ -z "$GITBRANCH" ]; then
  echo "No git branch found"
  exit 1
fi
if [ -z "$UPSTREAM" ]; then
  echo "No upstream found"
  exit 1
fi

git rebase --onto $UPSTREAM $GITBRANCH~1 $GITBRANCH