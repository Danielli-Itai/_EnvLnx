#!/bin/bash




export	GIT_USER=Danielli-Itai
export	GIT_USER_REPOS=https://$GIT_USER@github.com/Danielli-Itai




#install git - tested on UBUNTU 18.04.
function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}





echo 'GitSetup <param1> <param2> function installs the git client.'
echo 'param1 - git user name to set the git user'
echo 'param2 - git user email address'
# and cache git password for 1 hour.'
function GitSetup()
{
  # Install Github.
  sudo apt-get update
  sudo apt install git-all -y

  echo 'Git password ?'
  read pass
  echo $pass

  # Set global credentials.
  sudo git config --global user.name $1
	sudo git config --global user.email $2
	sudo git config --global user.password $pass

  sudo git config --global credential.helper 'cache --timeout=3600'
}




#clone git repository prm1: repository name
function GitClone()
{
	rm -rf $WORK_DIR/$1
	git clone $GIT_USER_REPOS/$1.git

  git clone "https://$GIT_USER:$GIT_PASS@github.com/$GIT_USER/$1.git"
#  git clone 'https://'$GIT_USER:$GIT_PASS'@github.com/'GIT_USER'/'$1'.git'

	#incase a setup file exists call the setup file.
	_FILE=$WORK_DIR/$1/$ENV_SETUP_FILE
	if test -f "$_FILE"; then
		echo "$_FILE exists."
		source $WORK_DIR/$1/$ENV_SETUP_FILE
	fi
}