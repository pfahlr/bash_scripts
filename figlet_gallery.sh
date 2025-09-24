#!/bin/zsh
# $1 = fonts directory $2 = string to process (in quotes if contains whitespace) $3 = max output width
FIGLETCMD="/usr/bin/figlet"
while [ $# -gt 0 ]; do
    case "$1" in
        --font-dir)
            font_directory_base="$2"
            shift 2
            ;;
        --width)
            width="$2"
            shift 2
            ;;
        --font-collection-count)
           font_collection_count="$2"
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

if [ ! -n "$font_directory_base" ]; then
  font_directory_base="$HOME/figlet-fonts"
fi

if [ ! -n "$font_collection_count" ]; then
  font_collection_count=2
fi

counter=0
for i in {1..$font_collection_count};
do
  if [ -n "$font_directory" ]; then
  #make sure your various collections are in 1,2,3,4 subdirectories, or change the script, up to you.
    font_directory="$font_directory_base/$i/"
  else
    font_directory="$HOME/figlet-fonts/$i/"
  fi
  for fontname in `print -rl -- $font_directory/*.flf(:r)`; do;
     if [ -n "$out_to_files_prefix" ]; then
        $FIGLETCMD -d $font_directory -w $width  -f $fontname $text > $out_to_files_prefix$counter.asc
    else
        echo "=============================================================================="
        echo "$fontname"
        echo "------------------------------------------------------------------------------"
        $FIGLETCMD -d $font_directory -w $width  -f $fontname $text
        echo "------------------------------------------------------------------------------"
    fi
    ((counter++))
  done
done




