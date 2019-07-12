#!/bin/bash

function specbump() {
    print "Version $1"
    git add .
    git commit -m "updated version to $1"
    git tag '$1'
    git push --tags
    pod trunk push LhHelpers.podspec --allow-warnings
}

specbump
