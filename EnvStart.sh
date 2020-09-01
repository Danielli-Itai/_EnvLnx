#!/bin/bash

<<<<<<< HEAD

export HOME_DIR=~
export ENV_DIR=$HOME_DIR/_EnvLnx
export PROJ_DIR=$HOME_DIR/_SwPrjects
=======
# For environment setup add this fil to the bashrc initialization file.
# using the following command-line.
# source /media/sf_C_DRIVE/_MicroSystem.TrunkWeb/_EnvLnx/EnvStart.sh
>>>>>>> 0f9e1beebdceab73b4c3993e2dcfdd2ea3c7f572

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
<<<<<<< HEAD
source ~/_EnvLnx/EnvDev.sh
source ~/_EnvLnx/EnvTools.sh
=======
>>>>>>> 0f9e1beebdceab73b4c3993e2dcfdd2ea3c7f572
source ~/_EnvLnx/EnvBuild.sh
source ~/_EnvLnx/EnvDev.sh
source ~/_EnvLnx/EnvTools.sh

#Call work directory environment setup files.
EnvSetup $WORK_DIR