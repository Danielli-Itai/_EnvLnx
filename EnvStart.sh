#!/bin/bash


export HOME_DIR=~
export ENV_DIR=$HOME_DIR/_EnvLnx
export PROJ_DIR=$HOME_DIR/_SwPrjects

echo 'Environment setup'
source ~/_EnvLnx/EnvBase.sh
source ~/_EnvLnx/EnvDev.sh
source ~/_EnvLnx/EnvTools.sh
source ~/_EnvLnx/EnvBuild.sh
