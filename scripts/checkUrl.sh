#!/bin/sh

response=$(curl -s -o /dev/null -i -w "%{http_code}" $2)

if [ $response -eq 200 ]
then
	echo "$1 is up"
	exit 0
else
	echo "$1 is down"
	exit 1
fi
