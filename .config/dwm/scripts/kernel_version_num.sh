#!/bin/bash

# Parameters
longNumber=2
kernelCommand="uname -r"
archCommand=$(uname -m)

# Kernel version
kernelVersion=""
count=1

# Extract numbers of kernel version
kernelVersionTemp=$(uname -r | cut -d "." -f ${count})
    kernelVersionTempDot="${kernelVersionTemp}"
    kernelVersion="${kernelVersion}${kernelVersionTempDot}"
    count=$(expr ${count} + 1)
    
while [ ${count} -le ${longNumber} ] ; do
    kernelVersionTemp=$(uname -r | cut -d "." -f ${count})
    kernelVersionTempDot=".${kernelVersionTemp}"
    kernelVersion="${kernelVersion}${kernelVersionTempDot}"
    count=$(expr ${count} + 1)
done

kernelVersionTemp=$(uname -r | cut -d "." -f ${count} | cut -d "-" -f 1)
kernelVersionTempDot=".${kernelVersionTemp}"
kernelVersion=${kernelVersion}${kernelVersionTempDot}

# Apply arch
#kernelVersion=${kernelVersion}-${archCommand}
kernelVersion=${kernelVersion}
#echo "Kernel: Linux ${kernelVersion} "
echo " ${kernelVersion} "

