#!/bin/sh
set -e # Stop execution of the code if any of the steps fails

echo "Checking docker installation"

if  ! Docker --version 
then
    echo "Docker is not installed"
    exit 1
else 
    echo "Docker is installed"
fi

# Stores the passed argument
action=$1
# Comparing the argument with the string
if [ $action == "images" ]
then
    echo "Removing Images"
    #rmi is used to delete the images and docker images -q gives all the docker image ids. 
    docker rmi -f $(docker images -q)
elif [ $action == "containers" ]
then
    echo "Removing Containers"
    docker rm -f $(docker ps -aq)
else
    echo "$action that has been passed is not valid, Please choose images or containers."
fi