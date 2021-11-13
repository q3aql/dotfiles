#!/bin/bash

# Script to get Public IP for Conky.
# Created by q3aql (q3aql@duck.com)
# Licensed by GPL v.2
# Date: 27-11-2016
# --------------------------------------

BUCLE=0
mkdir -p $HOME/.pIP/
pIP_FILE=$HOME/.pIP/pIP

while [ $BUCLE -le 1 ] ; do

P_IP=`curl http://icanhazip.com`
	while [ -z "$P_IP" ]; do
		sleep 3
		P_IP=`curl http://icanhazip.com`
	done
echo $P_IP > $pIP_FILE
sleep 1800
done
