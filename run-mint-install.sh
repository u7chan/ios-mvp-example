#!/bin/sh

if which mint >/dev/null; then
    mint bootstrap --verbose --overwrite y
else
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
fi
