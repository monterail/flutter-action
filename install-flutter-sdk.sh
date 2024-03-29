#!/bin/bash

CHANNEL="stable"
while getopts 'v:c:' param; do
  case $param in
    c) CHANNEL="$OPTARG" ;;
  esac
done

FLUTTER_PATH="$GITHUB_ACTION_PATH/flutter"
git clone -b "$CHANNEL" https://github.com/flutter/flutter.git "$FLUTTER_PATH"

{
  echo "$FLUTTER_PATH/bin"
  echo "$FLUTTER_PATH/bin/cache/dart-sdk/bin"
  echo "$HOME/.pub-cache/bin" # POSIX
  echo "$LOCALAPPDATA\Pub\Cache\bin" # Windows
} >> "$GITHUB_PATH"
