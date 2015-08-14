#!/bin/bash
set -o errexit
set -o nounset

function MoveToMaster {
  # Get the current branch and the upstream branch
  local CURRENT=$(git branch 2>/dev/null | sed -n 's/^\*\ //p')
  local PARENT=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

  if [ -z "$CURRENT" ]; then
    echo "No git branch found"
    exit 1
  fi
  if [ -z "$PARENT" ]; then
    echo "No upstream found"
    exit 1
  fi

  if [[ ! "$PARENT" == "master" ]]; then
    # If we have not hit master move to the upstream branch
    git checkout $PARENT 1>/dev/null
    # Recursively move down the path until we hit master
    MoveToMaster
    # Move back to the branch that was current when first invoking this cycle
    git checkout $CURRENT 1>/dev/null
  fi
  # Rebase on the upstream branch
  git rebase --onto $PARENT $CURRENT~1 $CURRENT 1>/dev/null
}

MoveToMaster
