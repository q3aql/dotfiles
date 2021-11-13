#!/bin/bash

# Script to show Public IP for Conky.
# Created by q3aql (q3aql@duck.com)
# Licensed by GPL v.2
# Date: 27-11-2016
# --------------------------------------

pIP_FILE=$HOME/.pIP/pIP

if [ -f $pIP_FILE ]; then
  cat $pIP_FILE
fi
