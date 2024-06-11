#!/bin/bash

mkdir testing

cp ./* ./testing

if find ./testing -mindepth 1 -maxdepth 1 | read 
then
	echo "Successful!"
else 
	echo "Unsuccessful"
fi


