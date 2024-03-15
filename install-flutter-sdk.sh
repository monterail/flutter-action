#!/bin/bash

CHANNEL="stable"
while getopts 'v:' param; do
  case $param in
    v) CHANNEL="$OPTARG" ;;
  esac
done

if [ -z "$CHANNEL" ]; then

FLUTTER_PATH="$GITHUB_ACTION_PATH/flutter"
git clone -b "$CHANNEL" https://github.com/flutter/flutter.git "$FLUTTER_PATH"

{
  echo "$FLUTTER_PATH/bin"
  echo "$FLUTTER_PATH/bin/cache/dart-sdk/bin"
  echo "$HOME/.pub-cache"
} >> "$GITHUB_PATH"
