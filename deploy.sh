#!/bin/bash

gitStatus=$(git status -sb)
compare='behind'

if [[ "$gitStatus" == *"$compare"* ]]; then 
    git pull
    hugo
    cp -r public/* /var/www/
fi
