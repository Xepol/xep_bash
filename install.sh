#!/bin/bash

function addToBashRC () {

	local fileName="${1}"


	if $(grep -q "source \${HOME}/${fileName}" ~/.bashrc); then
		echo "Calling ${fileName} already in .bashrc"
	else
		echo "Adding ${fileName} to .bashrc"
		echo "if [ -f \${HOME}/${fileName} ]; then source \${HOME}/${fileName}; fi" >> ~/.bashrc
	fi
}

ln $(pwd)/shlib ~/.shlib -s -f
ln $(pwd)/xepol_init ~/.xepol_init -s -f
ln $(pwd)/xepol_prompt ~/.xepol_prompt -s -f


addToBashRC ".xepol_init"
addToBashRC ".xepol_prompt"
