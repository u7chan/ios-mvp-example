#!/bin/sh

if ! which mint >/dev/null; then
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
    exit 1
fi

mint bootstrap --verbose --overwrite y
