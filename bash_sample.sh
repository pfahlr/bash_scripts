#!/bin/bash

SCRIPT_TITLE="example shell script"
FILENAME=$(basename $0)

function print_help {
  echo "$SCRIPT_TITLE"
  echo "usage: "
  echo "$FILENAME --option-a <mainarg>"
}

while [ $# -gt 0 ]; do
    case "$1" in
    --help)
        print_help;
        exit 0
        ;;
    --option-a)
        optiona="$2"
        shift 2
        ;;
    *)
        # Handle positional arguments or unknown options
        mainarg=$1
        shift 1
        ;;
    esac
done

if [ -n $optiona ]; then
  option_a=$optiona
fi

if [ -n $mainarg ]; then
  main_argument=$mainarg
fi

