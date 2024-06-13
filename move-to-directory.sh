#!/bin/bash

# This creates the directory
mkdir negpod_1-q1

# Files are moved from the current directory to the new folder
mv ./* ./negpod_1-q1

# A message is printed when the folder is not empty
if find ./negpod_1-q1 -mindepth 1 -maxdepth 1 | read 
then
	echo "Successful!"
else 
	echo "Unsuccessful"
fi
