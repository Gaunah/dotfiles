#!/bin/bash

pushd $(dirname $0) > /dev/null # move to script folder
cd ..
DOTFILE_DIR=$(pwd)

find -name ".*" -type f | xargs -I{} cp -vfi {} ~
cp -vri .vim ~
scripts/get_VundleVim.sh

popd > /dev/null
