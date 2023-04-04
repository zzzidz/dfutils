#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

type=$1
url=$2

if [ "$mystring" = "hello" ]; then
  echo "The string is 'hello'"
else
  echo "The string is not 'hello'"
fi