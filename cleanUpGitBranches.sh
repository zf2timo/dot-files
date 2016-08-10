#!/usr/bin/env bash

BRANCHES="$(git branch --merged | grep -v "\*")"

if [ -z $BRANCHES ]; then
    echo "No branch can deleted safely"
    exit 1;
fi

echo "The following branches will be deleted:"
echo $BRANCHES
echo "Are you sure? (y or n)"
read ANSWER

if [ $ANSWER = "y" ]; then
    echo $BRANCHES | xargs -n 1 git branch -d
fi
