#!/usr/bin/env bash

# the application name
appName=user-manager

# remove containers
docker rm -f $appName

# remove images
docker rmi $appName

# remove dangling images
docker image prune

# remove unused volumes
docker volume prune

# set the application tag for building and running
appTag=aikay/$appName

echo '---------------------'
echo 'Building application'
echo '---------------------'
docker build -t $appTag .

echo '---------------------'
echo 'Running application'
echo '---------------------'
dbName=user-manager-db
docker run --name $appName -d -p 49160:3000 --link $dbName:$dbName $appTag