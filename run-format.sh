#!/bin/sh

if which mint >/dev/null; then
    mint run SwiftFormat mvp-example
else
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
fi
