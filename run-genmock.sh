#!/bin/sh

if ! which mint >/dev/null; then
  echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
  exit 1
fi

TARGET_DIR=$1
EXPORT_MOCK_FILE=$2
SCHEME_NAME=$3

if [ -z "$TARGET_DIR" ] || [ -z "$EXPORT_MOCK_FILE" ] || [ -z "$SCHEME_NAME" ]; then
  echo "usage: "
  echo "  arg1: <target_dir>"
  echo "  arg2: <export_mock_file>"
  echo "  arg3: <scheme_name>"
  exit 1
fi

EXPORT_FILE=$TARGET_DIR/$EXPORT_MOCK_FILE

rm -f $TARGET_DIR/$EXPORT_MOCK_FILE
mint run mockolo --sourcedirs $TARGET_DIR --mock-final --destination $EXPORT_FILE
sed -i -e "s/import Foundation/import Foundation\n@testable import $SCHEME_NAME/" $EXPORT_FILE
