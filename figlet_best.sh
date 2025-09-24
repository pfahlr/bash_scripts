#!/bin/zsh
# $1 = fonts directory $2 = string to process (in quotes if contains whitespace) $3 = max output width
FIGLETCMD="/usr/bin/figlet"
while [ $# -gt 0 ]; do
    case "$1" in
        --font-dir)
            font_directory="$2"
            shift 2
            ;;
        --width)
            width="$2"
            shift 2
            ;;
        --out-to-files-prefix)
           out_to_files_prefix=$2
           shift 2
           ;;
        *)
            # Handle positional arguments or unknown options
            text=$1
            shift 1
            ;;
    esac
done

if [ ! -n "$width" ]; then
  width="80"
fi

if [ ! -n "$font_directory" ]; then
  font_directory="$HOME/figlet-fonts/1/"
fi

counter=0

for fontname in `cat  /home/rick/bash_scripts/figlet_top_100`; do;
  if [ -n "$out_to_files_prefix" ]; then
      $FIGLETCMD -d $font_directory -w $width  -f $fontname $text > $out_to_files_prefix$counter.asc
  else
    echo "=============================================================================="
    echo "$fontname"
    echo "------------------------------------------------------------------------------"
    $FIGLETCMD -d $font_directory -w $width -f $fontname $text
    echo "------------------------------------------------------------------------------"
  fi
  ((counter++))
done




