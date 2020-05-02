#bash
#build commands


#Get Gcc version.
function EnvGccVer()
{
	gcc --version
}

#install GCC build tools.
function EnvGccInstall()
{
	#updating the packages list:
	sudo apt update
	
	#Install the build-essential package
	sudo apt install build-essential
	
	# install the manual pages about using GNU/Linux for development
	sudo apt-get install manpages-dev
}

#install GCC cross build tools for ARM.
# For using this GCC in the build process write:	CC=arm-linux-gnueabihf-gcc make
function EnvGccCrossInstall()
{
	sudo apt-get install -y gcc-arm-linux-gnueabi
	#sudo apt-get install -y gcc-arm-linux-gnueabihf
	sudo apt-get install -y binutils-arm-linux-gnueabi

}
