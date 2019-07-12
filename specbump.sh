#!/bin/bash

function specbump() {
    echo "Version $1"
    git add .
    git commit -m "updated version to $1"
    git push
    git tag $1
    git push --tags
    pod trunk push LhHelpers.podspec --allow-warnings
}

specbump $1
