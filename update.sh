#!/bin/bash
set -e
git pull origin master
DEPENDENCY="coffee-react"
VERSION=`gem search "^$DEPENDENCY\$" --remote | egrep -o '[0-9]\.[0-9]\.[0-9]'`
echo "updating to $VERSION"
npm version $VERSION
bundle install
if [ -n "$(git status --porcelain)" ]; then 
  git commit -a
fi
rake test
read -p "will publish $VERSION. are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rake release
  git push origin master
fi