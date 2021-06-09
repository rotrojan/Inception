#!/bin/bash

if [ "$DEBUG" == 1 ]
then
	exec /bin/bash
else
	exec $@
fi
