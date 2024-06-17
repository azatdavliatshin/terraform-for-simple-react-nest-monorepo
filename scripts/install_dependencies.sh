#!/bin/bash
set -e

PROJECT_DIR=$1

echo "Installing dependencies for project in $PROJECT_DIR"
cd $PROJECT_DIR

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null
then
    echo "pnpm could not be found, installing it..."
    npm install -g pnpm
fi

# Run pnpm install
echo "Running pnpm install..."
pnpm install