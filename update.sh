#!/bin/bash
set -e
git pull origin master
DEPENDENCY="coffee-react"
VERSION=`gem search "^$DEPENDENCY\$" --remote | egrep -o '[0-9]\.[0-9]\.[0-9]'`
echo "updating to $VERSION"
npm version $VERSION
bundle install
git commit -a -m "updated Gemfile.lock"
rake test
read -p "will publish $VERSION. are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rake release
  git push origin master
fi