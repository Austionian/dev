#!/usr/bin/env bash

git submodule init
git submodule update
pushd env/dotfiles
git checkout master
popd
