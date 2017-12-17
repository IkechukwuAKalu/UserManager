#!/usr/bin/env bash

# the database name
dbName=user-manager-db

# remove containers
docker rm -f $dbName

# remove images
docker rmi $dbName

# remove dangling images
docker image prune

# remove unused volumes
docker volume prune

# set the database tag for building and running
dbTag=aikay/$dbName

echo '---------------------'
echo 'Building database'
echo '---------------------'
docker build -t $dbTag .

echo '---------------------'
echo 'Running database'
echo '---------------------'
docker run --name $dbName -d -p 27017:27017 $dbTag