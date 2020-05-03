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
#arm-none-eabi-gcc: -Arch = ARM -Vendor = N/A -OS = None (Bare-Metal) -ABI = EABI
#arm-linux-gnueabi-gcc:	-Arch = ARM -Vendor = N/A -OS = Linux OS -ABI = GNUEABI
function EnvGccCrossInstall()
{
	sudo apt-get install -y gcc-arm-linux-gnueabi
	#sudo apt-get install -y gcc-arm-linux-gnueabihf
	sudo apt-get install -y binutils-arm-linux-gnueabi

}



function EnvGccInfo()
{
	gcc --version
	which gcc
	man gcc

	sudo ls –la /usr/bin/*gcc
	
	#Showd all tools in the Cross-Compiler Toolchain
	ls –la /usr/bin/arm-none-eabi*

}

