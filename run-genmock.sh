#!/bin/sh

TARGET_DIR=$1
DST_FILE_NAME="OutputMocks.swift"

if [ -z "$TARGET_DIR" ]; then
  echo "usage: "
  echo "  arg1: <target_dir>"
  exit 1
fi

if which mint >/dev/null; then
  rm -f $TARGET_DIR/$DST_FILE_NAME
  mint run mockolo --sourcedirs $TARGET_DIR --mock-final --destination $TARGET_DIR/$DST_FILE_NAME
else
  echo "[ERROR] Mint not installed, download from https://github.com/yonaskolb/Mint"
  exit 1
fi
