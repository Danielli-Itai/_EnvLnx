#!/bin/bash
#Keep linux End of line conversion.
echo  "*********************************"
echo  "       Environment setup         "
echo  "*********************************"
echo "For environment setup call this file from the bashrc initialization file."
echo "# source /media/sf_C_DRIVE/_MicroSystem.TrunkWeb/_EnvLnx/EnvStart.sh"





#echo 'Environment setup'
#export HOME_DIR=~
#export WORK_DIR=~
#export ENV_DIR=$HOME_DIR/_EnvLnx
#export PROJ_DIR=$HOME_DIR/_SwPrjects





echo	"Environment version: EnvClone, EnvPull, EnvClear"
#Clone new environment from git.
function EnvClone()
{
	sudo git clone https://github.com/Danielli-Itai/_EnvLnx.git
}

#Pull latest version.
function EnvPull()
{
	cd _EnvLnx
	sudo git pull https://github.com/Danielli-Itai/_EnvLnx.git
	source _EnvLnx/EnvStart.sh
	cd ..
}

#Clear the environment.
function EnvClear()
{
	sudo rm -fr _EnvLnx
}







# Dispaly function name at startup.
function _FunctionStarts
{
	echo	*********************** $1 ***********************
}





#Environment initialization.
source ./_EnvLnx/EnvBase.sh
source ./_EnvLnx/EnvBuild.sh
source ./_EnvLnx/EnvDev.sh
source ./_EnvLnx/EnvDocker.sh
source ./_EnvLnx/EnvGit.sh
source ./_EnvLnx/EnvTools.sh
source ./_EnvLnx/EnvPython.sh
source ./_EnvLnx/EnvR.sh
source ./_EnvLnx/EnvMySql.sh
source ./_EnvLnx/EnvNodeJs.sh
source ./_EnvLnx/EnvSetup.sh

source ./_EnvLnx/Docker/EnvDocker.sh





#SearchGit for environment setup files and call them.
function EnvSetup()
{
  FILES=$1/*
	ENV_SETUP_FILE="EnvStar.sh"
	
  for f in $FILES
  do
	_FILE=$f/$ENV_SETUP_FILE
	    echo "$_FILE exists."
	    source $_FILE
#	fi
    done
}

#Call work directory environment setup files.
#EnvSetup $WORK_DIR
