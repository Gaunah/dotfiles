#!/bin/bash

pushd $(dirname $0) > /dev/null # move to script folder
cd ..

find -name ".*" -type f | xargs -I{} cp -vfi {} ${HOME}

popd > /dev/null
