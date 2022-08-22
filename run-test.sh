#!/bin/sh

if ! which xcpretty >/dev/null; then
    echo 'warning: Xcpretty not installed. Please install xcpretty from https://github.com/xcpretty/xcpretty'
    exit 1
fi

set -o pipefail

PROJECT_FILE=$1
SCHEME_NAME=$2
DEVICE_ID=$3

if [ -z "$PROJECT_FILE" ] || [ -z "$SCHEME_NAME" ] || [ -z "$DEVICE_ID" ]; then
    echo "usage: "
    echo "  arg1: <target_dir>"
    echo "  arg2: <scheme_name>"
    echo "  arg3: <device_id>"
    exit 1
fi

xcodebuild "-workspace" \
    "$PROJECT_FILE/project.xcworkspace" \
    "-scheme" \
    "$SCHEME_NAME" \
    "build" \
    "test" \
    "-destination" \
    "id=$DEVICE_ID" | xcpretty \
    "--color" \
    "--report" \
    "html" \
    "--output" \
    "test-results.html"
