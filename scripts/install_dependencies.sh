#!/bin/bash
set -e

PROJECT_DIR=$1

echo "Installing dependencies for project in $PROJECT_DIR"
cd $PROJECT_DIR
pnpm install
