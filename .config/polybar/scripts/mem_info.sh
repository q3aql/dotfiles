#!/bin/bash

free -h | awk '/Mem:/ { printf("  %5s / %s \n", $3, $2) }'
