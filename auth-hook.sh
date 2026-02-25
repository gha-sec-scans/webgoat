#!/bin/bash
HOST=$1
PORT=$2

# Registramos y logueamos...
curl -s -X POST "http://$HOST:$PORT/WebGoat/register.mvc" -d "username=admin&password=admin&matchingPassword=admin&agree=agree" > /dev/null
COOKIE=$(curl -s -c - -X POST "http://$HOST:$PORT/WebGoat/login" -d "username=admin&password=admin" | awk '/JSESSIONID/ {print $7}')

echo "Cookie|JSESSIONID=$COOKIE"