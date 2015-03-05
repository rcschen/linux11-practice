#!/bin/bash

bootsect=$1
setup=$2
system=$3
IMAGE=$4
root_dev=$5

if [ -z $root_dev ]; then
   DEFAULT_MAJOR_ROOT=3
   DEFAULT_MINOR_ROOT=1
else
   DEFAULT_MAJOR_ROOT=${root_dev:0:2}
   DEFAULT_MINOR_ROOT=${root_dev:2:3}
fi
echo $DEFAULT_MAJOR_ROOT
echo $DEFAULT_MINOR_ROOT
echo -en  "\x$DEFAULT_MINOR_ROOT\x$DEFAULT_MAJOR_ROOT"
echo $IMAGE

[ ! -f "$bootsect" ] && echo "no bootsect exists" && exit -1
dd if=$bootsect bs=512 count=1 of=$IMAGE 
#[ ! -f "$setup" ] && echo "no setup exists" && exit -1
#[ ! -f "$system" ] && echo "no system exists" && exit -1

echo -ne "\x$DEFAULT_MINOR_ROOT\x$DEFAULT_MAJOR_ROOT" | dd ibs=1 obs=1 count=2 seek=508 of=$IMAGE conv=notrunc  2>&1 >/dev/null
