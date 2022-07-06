#!/bin/bash

function parse_git_branch {
  git branch --no-color 2> /dev/null |  grep '^*' | colrm 1 2
}

function changes_in_branch {
    if  [[ "$(git status 2> /dev/null)" ]]; then
	    if expr length + "$(git status -s 2> /dev/null)" 2>&1 > /dev/null; then     
	        echo -ne "\033[0;31m($(parse_git_branch))\033[0m"; 
	    else
	        echo -ne "\033[0;32m($(parse_git_branch))\033[0m"; fi;
    fi
}

function check_home_size {
    du -h | grep -e "^[^/]*\/[^/]*$"
}


