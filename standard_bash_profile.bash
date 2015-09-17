if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then

    debian_chroot=$(cat /etc/debian_chroot)

fi
function PrintCurrentBranch {
 echo $(git branch 2>/dev/null | sed -n 's/^\*\ //p')
}

function PrintMasterPath {
  local CURRENT=$1
  local PARENT=`git rev-parse --abbrev-ref --symbolic-full-name ${CURRENT}@{u} 2>/dev/null`

  if [ -z "$CURRENT" ]; then
    echo "No git branch found"
    exit 1
  fi

  local PARENT_LINE=""
  if [[ "$PARENT" == "" ]]; then
    local PARENT_LINE=""
    echo "${CURRENT}"
    exit 0
  else
    if [[ ! "$PARENT" == "master" ]]; then
      local PARENT_LINE="`PrintMasterPath ${PARENT}`->"
    else
      local PARENT_LINE="master->"
    fi
  fi
  echo "${PARENT_LINE}${CURRENT}"
}

function promptcmd() {
  GITBRANCH=$(git branch 2>/dev/null | sed -n 's/^\*\ //p')
  FULL_BRANCH=`PrintMasterPath ${GITBRANCH}`

  CURRENT_TIME_SINCE_EPOCH=`date +%s`
  COMMAND_ELAPSED_TIME=0
  if [ ! -z "$PROMPT_TIME_SINCE_EPOCH" ]; then
    COMMAND_ELAPSED_TIME=`expr $CURRENT_TIME_SINCE_EPOCH - $PROMPT_TIME_SINCE_EPOCH`
  fi
  export PROMPT_TIME_SINCE_EPOCH=$CURRENT_TIME_SINCE_EPOCH
  COMMAND_ELAPSED_TIME=`show_time $COMMAND_ELAPSED_TIME`

  PS1='${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w [${FULL_BRANCH}] { `date` } { $COMMAND_ELAPSED_TIME }\[\033[00m\]\n\$ '
}

function show_time () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

export PROMPT_COMMAND=promptcmd
export HISTSIZE=50000