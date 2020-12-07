#!/bin/bash+--
#Keep linux End of line conversion.





function PythonInst()
{
	sudo apt update -y
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt install python3.8
	sydo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8
	
	sudo rm /usr/bin/python3
	sudo ln -s python3.8 /usr/bin/python3

	sudo apt install -y python3-pip
	sudo python3 -m pip install --upgrade pip*
	sudo apt-get install -y python3-tk
}



# Run a python program in background.
function PyRun()
{
	sudo python3 $1 &
}
