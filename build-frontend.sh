#!/bin/bash

# Navigate to the React project directory
echo "Navigating to the React project directory..."
cd /path/to/react/project

# Check if Node.js and npm are installed
if ! [ -x "$(command -v node)" ]; then
    echo "Error: Node.js is not installed." >&2
    exit 1
fi

if ! [ -x "$(command -v npm)" ]; then
    echo "Error: npm is not installed." >&2
    exit 1
fi

# Install project dependencies
echo "Installing dependencies..."
npm install

# Build the project
echo "Building the React application..."
npm run build

# Check if the build was successful
if [ -d "build" ]; then
    echo "React application built successfully."
else
    echo "Build failed." >&2
    exit 1
fi
