#!/bin/zsh

SCRIPT_TITLE="manually clear various memory"
FILENAME=$(basename $0)

function print_help {
  echo "$SCRIPT_TITLE"
  echo "usage: "
  echo "$FILENAME --page-cache | --dentries-inodes | --all-cache |  --swap "
  echo "Running these commands is not generally advisable. You'll be ok so long as this isn't a production server. Worst case you'll hose your current boot and need to hard-reset. This may release you from a frozen system, and that's when the use of this script is indicated."
}

function clear_page_cache {
    echo "clearing page cache!"
    sudo sync; echo 1 | sudo tee /proc/sys/vm/drop_caches
    free -h
}

function clear_dentries_inodes {
    echo "clearing dentries/inodes"
    sudo sync; echo 2 | sudo tee /proc/sys/vm/drop_caches
    free -h
}

function clear_page_cache_dentires_inodes {
    echo "clearing page cache, dentries, inodes"
    sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
    free -h
}

function clear_swap {
    echo "resetting swap"
    sudo swapoff -a
    sudo swapon -a
    free -h
}


if [ $# -lt 1 ]; then
  print_help;
  exit 0;
fi

free -h

while [ $# -gt 0 ]; do
    case "$1" in
        --help)
            print_help;
            exit 0
            ;;
        --page-cache)
            clear_page_cache
            shift 1
            ;;
        --dentries-inodes)
            shift 1
            clear_dentries_inodes
            ;;
        --all-cache)
            shift 1
            clear_page_cache_dentires_inodes
            ;;
        --swap)
            shift 1
            clear_swap
            ;;
        *)
            # Handle positional arguments or unknown options
            shift 1
            mainarg=$1
            ;;
    esac
done

if [ -n $optiona ]; then
  option_a=$optiona
fi

if [ -n $mainarg ]; then
  main_argument=$mainarg
fi

