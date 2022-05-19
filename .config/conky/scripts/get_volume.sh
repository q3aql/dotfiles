#!/bin/bash

get_volume=$(amixer | grep "%" | head -1 | cut -d "%" -f 1 | cut -d "[" -f 2)
echo "${get_volume}% "
