#!/bin/bash

clear

### Check for errors; abandon the process if error exist
function checkError {
	COLOR='\033[01;31m'	# bold red
	RESET='\033[00;00m'	# normal white

    if [[ $1 != 0 ]] ; then
        echo "${COLOR}An error has been encountered. Please check the error logs.${RESET}"

        #prevent commit with error code
        exit 99
    fi
}

cd _lint/

echo "*** Checking code for lint... ***"
node lint_roller.js
checkError $?

### Exit successfully
exit 0