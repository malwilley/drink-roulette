#!/bin/bash
set -e # Exit with nonzero exit code if anything fails
gh-pages -d dist # Publish 'dist' folder to gh-pages branch
rm -rf dist # Delete folder contents when done
