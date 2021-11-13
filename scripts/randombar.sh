#!/bin/bash

# Script to show random bar
# Created by q3aql (q3aql@protonmail.ch)
# Licensed by GPL v.2
# Date: 10-01-2020
# --------------------------------------
VERSION="1.0"

# Variables
randomNumber=$(expr $RANDOM % 21)

# Show percentage bar
if [ ${randomNumber} -eq 0 ] ; then
	showRandomBar="="
elif [ ${randomNumber} -eq 1 ] ; then
	showRandomBar="="
elif [ ${randomNumber} -eq 2 ] ; then
	showRandomBar="=="
elif [ ${randomNumber} -eq 3 ] ; then
	showRandomBar="==="
elif [ ${randomNumber} -eq 4 ] ; then
	showRandomBar="===="
elif [ ${randomNumber} -eq 5 ] ; then
	showRandomBar="====="
elif [ ${randomNumber} -eq 6 ] ; then
	showRandomBar="======"
elif [ ${randomNumber} -eq 7 ] ; then
	showRandomBar="======="
elif [ ${randomNumber} -eq 8 ] ; then
	showRandomBar="========"
elif [ ${randomNumber} -eq 9 ] ; then
	showRandomBar="========="
elif [ ${randomNumber} -eq 10 ] ; then
	showRandomBar="=========="
elif [ ${randomNumber} -eq 11 ] ; then
	showRandomBar="==========="
elif [ ${randomNumber} -eq 12 ] ; then
	showRandomBar="============"
elif [ ${randomNumber} -eq 13 ] ; then
	showRandomBar="============="
elif [ ${randomNumber} -eq 14 ] ; then
	showRandomBar="=============="
elif [ ${randomNumber} -eq 15 ] ; then
	showRandomBar="==============="
elif [ ${randomNumber} -eq 16 ] ; then
	showRandomBar="================"
elif [ ${randomNumber} -eq 17 ] ; then
	showRandomBar="================="
elif [ ${randomNumber} -eq 18 ] ; then
	showRandomBar="=================="
elif [ ${randomNumber} -eq 19 ] ; then
	showRandomBar="==================="
elif [ ${randomNumber} -eq 20 ] ; then
	showRandomBar="===================="
fi

echo ${showRandomBar}
