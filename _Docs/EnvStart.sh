#!/bin/bash

#to find out where is .bashrc run the following command:
echo exit | strace bash -li |& grep '^open' | grep '.bashrc'

# For environment setup add this fil to the bashrc initialization file.
# using the following command-line.
# source /media/sf_C_DRIVE/_MicroSystem.TrunkWeb/_EnvLnx/EnvStart.sh
echo 'Environment setup'
source ~/_EnvLnx/EnvBase.sh
source ~/_EnvLnx/EnvBuild.sh