#!/bin/bash

# Find and delete all node_modules directories below the current directory

echo "Searching for all node_modules directories under $(pwd)..."

# Use find to locate and delete node_modules directories
find . -type d -name "node_modules" -prune -exec rm -rf '{}' +

echo "All node_modules directories deleted."
