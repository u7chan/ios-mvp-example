#!/bin/sh

TARGET=$1
DST_FILE_NAME="OutputMocks.swift"

if [ -z "$TARGET" ]; then
  TARGET="./mvp-example"
fi

if which mint >/dev/null; then
  rm -f $TARGET/$DST_FILE_NAME
  mint run mockolo --sourcedirs $TARGET --mock-final --destination $TARGET/$DST_FILE_NAME
else
  echo "[ERROR] Mint not installed, download from https://github.com/yonaskolb/Mint"
  exit 1
fi
