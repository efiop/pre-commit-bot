#!/bin/bash

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

if [ -f "./.pre-commit-config.yaml" ]; then
    reformat=false
    pre-commit run --all-files || reformat=true
    if [[ "$reformat" == "true" ]]; then
        # e.g. refs/pull/7/merge -> 7
        BRANCH="$(echo $GITHUB_REF | cut -d '/' -f 3)"-reformatted
        git checkout -b $BRANCH
        git add .
        git commit -m "Run pre-commit hooks"
        git push --force -u origin $BRANCH 
    fi
else
    echo "'pre-commit-config.yaml' is not found"
fi
