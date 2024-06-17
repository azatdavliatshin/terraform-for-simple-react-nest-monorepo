#!/bin/bash
set -e

PROJECT_DIR=$1

echo "Deploying project in $PROJECT_DIR to Docker"
cd $PROJECT_DIR
docker build -t ${PROJECT_DIR}:latest .
docker run -d --name ${PROJECT_DIR} -p 3000:3000 ${PROJECT_DIR}:latest
