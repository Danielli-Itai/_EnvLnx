#!/bin/bash
#Keep linux End of line conversion.





function PythonInst()
{
	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt install python3.8
	sudo apt install -y python3-pip
	
	sudo apt-get install -y python3-tk
}



# Run a python program in background.
function PyRun()
{
	sudo python3 $1 &
}
