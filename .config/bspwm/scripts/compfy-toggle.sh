#!/bin/bash
if pgrep -x "compfy" > /dev/null
then
	pkill compfy
else
    compfy --daemon
fi
