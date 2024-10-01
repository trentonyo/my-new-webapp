#!/bin/bash
export PATH="./node_modules/.bin:$PATH"

REQUIRED_VERSION="2.9.0"
VERSION_STRING=$(git --version)
GIT_VERSION=$(echo $VERSION_STRING | awk '{print $3}')

if [[ $(semver "$GIT_VERSION" -r ">=$REQUIRED_VERSION") ]]; then
    echo "Git version is greater than or equal to $REQUIRED_VERSION"
    echo "-- FAILING CHECK In order to install git hooks"
    exit 1
else
    echo "Git version is less than $REQUIRED_VERSION"
    echo "-- Unable to install git hooks"
fi
