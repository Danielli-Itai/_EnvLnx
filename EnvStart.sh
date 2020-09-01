#!/bin/bash

# For environment setup add this fil to the bashrc initialization file.
# using the following command-line.
# source /media/sf_C_DRIVE/_MicroSystem.TrunkWeb/_EnvLnx/EnvStart.sh

echo 'Environment setup'
export WORK_DIR=~


#environment setup files provid environment functions and variables.
export	ENV_SETUP_FILE=EnvSetup.sh





#SearchGit for environment setup files and call them.
function EnvSetup()
{
    FILES=$1/*
    for f in $FILES
    do
	_FILE=$f/$ENV_SETUP_FILE
	if test -f "$_FILE"; then
	    echo "$_FILE exists."
	    source $_FILE
	fi
    done
}




#Environment initialization.
source ~/_EnvLnx/EnvBase.sh
source ~/_EnvLnx/EnvBuild.sh
source ~/_EnvLnx/EnvDev.sh
source ~/_EnvLnx/EnvTools.sh

#Call work directory environment setup files.
EnvSetup $WORK_DIR