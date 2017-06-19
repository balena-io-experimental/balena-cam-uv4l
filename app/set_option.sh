#!/bin/bash
# Look for pre-existing option. If not found, create it.
set_option() {
  if [[ -z $1 || -z $2 || -z $3 ]]; then return; fi

  # Using the ^ delimiter so that we don't conflict with file paths.
  sed -i '/'"$1\s*=\s*\w*"'/{s^^'"\n$1=$2"'^g;h};${x;/./{x;q0};x;q1}' $3 || echo $1=$2 >> $3
}
