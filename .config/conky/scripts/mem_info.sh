#!/bin/bash

mem_info=$(free -h | awk '/Mem:/ { printf("  %5s/%s \n", $3, $2) }')
echo ${mem_info}
