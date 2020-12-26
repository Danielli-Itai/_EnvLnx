#!/bin/bash
#Keep linux End of line conversion.
echo "Git environment: GitInstall, GitInformation, GitSetup, GitClone, GitCommit, GitPull, GitReset, GitOverride"





#install git - tested on UBUNTU 18.04.
function GitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}

#Show git information.
function GitInformation()
{
	sudo git --version
	sudo git config --list
}


# 'GitSetup <param1> <param2> function installs the git client.'
# 'param1 - git user name to set the git user'
# 'param2 - git user email address'
# and cache git password for 1 hour.'
function GitSetup()
{
	# Set global credentials.
	echo 'Git user name ?'
	read user
	sudo git config --global user.name $user

	echo 'Git e-mail ?'
	read email
	sudo git config --global user.email $email

#	echo 'Git password ?'
#	read pass
#	sudo git config --global user.password $pass

	sudo git config --global credential.helper 'cache --timeout=3600'
}



#clone git repository prm1: repository name
#function GitClone()
#{
#	sudo rm -rf $WORK_DIR/$1
#	sudo git clone $GIT_USER_REPOS/$1.git
#
#	sudo git clone "https://$GIT_USER:$GIT_PASS@github.com/$GIT_USER/$1.git"
#
#	#incase a setup file exists call the setup file.
#	_FILE=$WORK_DIR/$1/$ENV_SETUP_FILE
#	if test -f "$_FILE"; then
#		echo "$_FILE exists."
#		source $WORK_DIR/$1/$ENV_SETUP_FILE
#	fi
#}


# Pull Python repository and Install.
function GitClone()
{
	# Pull latest version from Github.
	echo "*** Cloning $1"
	sudo git clone https://github.com/Danielli-Itai/$1.git
	
	sudo chmod -fR 777 $1
}



#commit Files chages.
function GitCommit()
{
        sudo git stage .
        sudo git commit
        sudo git push
}


# Pull Python repository.
function GitPull()
{
	# Move to folder and Pull latest version from Github.
	echo "*** Pulling $1"
	cd $1
	sudo git pull https://github.com/Danielli-Itai/$1.git
	# Return to previouse folder.
	cd ..
}

#pull discharging changes.
function GitReset()
{
	cd $1
	sudo git reset --hard
	sudo git pull
	cd ..
}
