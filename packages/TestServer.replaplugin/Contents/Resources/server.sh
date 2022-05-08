#!/bin/bash

set -e

ruby -run -e httpd -- -p 0 . 2>&1 | while read -r line; do
  echo "$line"
  if [[ "$REPLA_WINDOW_ID" == "true" ]]; then
    if [[ $line =~ port=([0-9]+)$ ]]; then
      port="${BASH_REMATCH[1]}"
      osascript -e "tell application \"Repla\" to do JavaScript \"document.title = '$port'\" in window $REPLA_WINDOW_ID"
    fi
  fi
done
