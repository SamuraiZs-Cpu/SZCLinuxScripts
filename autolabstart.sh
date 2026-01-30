#!/bin/bash

### convenience scripts to start red hat labs.
# l18 starts a lab 
# l19 ends a lab
# lg grades a lab

# debug
#set -v

# chatGPT bullshittery to make sure the data file is stored in the same directory of this bash script. Though I can understand how it works, it does not agree with my soul. oh well.

# This will cause problems if the file is placed in bashrc.d/ because it will try to run the datafile as a command. 

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

touch ""$SCRIPT_DIR"/REDHATLAB_NAMESTR.txt"
DATAFILE=$(<"$SCRIPT_DIR"/REDHATLAB_NAMESTR.txt)

l18() {

# is the provided argument "0"?
	if [ -z "$1" ]; then
		echo 'needs an rhlab. ex: "l18 <redhat lab>"'
		return 1
	fi

# ___main function___
	#save our input to the data file using it's absolute file path
	echo "$1" > "$SCRIPT_DIR"/REDHATLAB_NAMESTR.txt"
	echo "l18 to start labs. l19 to end them. grademe to grade labs. \nstoring $1"
	lab start $1
	# bonus features

	if [[ "$2" == "-l" ]]; then
		echo -e "starting server b\n"
		ssh serverb

	elif [[ "$2" == "-ge" ]]; then
		echo -e "starting server a\n"
		ssh servera
	fi

	return 0
	}


# finish the lab
l19() {
	if [ -z "$DATAFILE" ]; then
		echo "error, failure to read file or no argument provided by l18"
		return 1 
	lab finish $DATAFILE
	fi
	}

# grade the value
grademe() {
	if [ -z "$DATAFILE" ]; then
		echo "error, failure to read file or no argument provided by l18"
		return 1 

	lab grade $DATAFILE
	fi
	}
	
	
	


	