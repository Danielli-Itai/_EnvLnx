#!/bin/bash
#Docker build environment.
echo "EnvDocker - EnvDockerBuild, EnvDockerRunIteract, EnvDockerRunDetached, EnvDockerSave, EnvDockerLoad"





#Environment variables.
#Docker Coder Apprentice tag.
export ENV_DOCKER_TAG=coder_app/bsase:latest
export ENV_DOCKER_FILE=coder_app.base.tar





function EnvDockerBuild()
{
	sudo chmod 777 -R ./Docker
	sudo docker build -f ./Docker/Dockerfile -t $ENV_DOCKER_TAG .
}


function EnvDockerRunInteract()
{
	sudo docker run -i  -t $ENV_DOCKER_TAG
}


function CAppDockerRunDetached()
{
	sudo docker run -t -d $ENV_DOCKER_TAG
}


function CAppDockerExec()
{
	sudo docker exec -it $ENV_DOCKER_TAG bash
}


function CAppDockerSave()
{
	sudo docker save $ENV_DOCKER_TAG > $ENV_DOCKER_FILE
}

function CAppDockerLoad()
{
	sudo docker load < $ENV_DOCKER_FILE
}
