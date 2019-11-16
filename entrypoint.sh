#!/bin/sh

set -e
set -x

echo "machine github.com" >> $HOME/.netrc
echo "login $GITHUB_ACTOR" >> $HOME/.netrc
echo "password $GITHUB_TOKEN" >> $HOME/.netrc
echo "machine api.github.com" >> $HOME/.netrc
echo "login $GITHUB_ACTOR" >> $HOME/.netrc
echo "password $GITHUB_TOKEN" >> $HOME/.netrc
chmod 600 $HOME/.netrc

git config --global user.name "Pre-commit GitHub Action"
git config --global user.email "actions@github.com"

git status
