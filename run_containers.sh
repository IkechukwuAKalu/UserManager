#!/usr/bin/env bash

# enter to the docker directory
cd docker

# enter the db directory
cd db
# build and run the database container
echo '----------------------------------------'
echo 'Database container'
echo '----------------------------------------'
sh ./start_db.sh

# go back to the docker directory
cd ..
# go back to the root directory
cd ..

# build and run the application container
echo '----------------------------------------'
echo 'Application container'
echo '----------------------------------------'
sh ./start_app.sh