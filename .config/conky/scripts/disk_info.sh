#!/bin/bash

disk_info=$(df -h / | awk '/\//{ printf("%4s/%s \n", $4, $2) }')
echo ${disk_info}
