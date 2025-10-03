#!/bin/zsh
# $1 = fonts directory $2 = string to process (in quotes if contains whitespace) $3 = max output width

FIGLETCMD="/usr/bin/figlet"

function print_help {
  echo "usage: "
  echo 'figlet_gallery.sh <options> "<text to format>"' 
  echo "options:"
  echo "  --font-dir: the directory containing the figlet font flf/tlf files (default: ~/figlet-fonts/collection/)"
  echo "  --width: the maximum display width of the output (default:80)"
  echo "  --figlet-cmd: the figlet command to use (default: $FIGLETCMD)"
  echo "  --out-file: a file to store the output (opens append mode)"
  echo "  --out-file-prefix: a base file path to store the output (resulting files will be <out-file-prefix><n>.asc"
}

if [ $# -lt 1 ]; then
  echo "you must, at the very least, supply some text to format for this script to function. See usage info below:"
  print_help;
  exit 1
fi

while [ $# -gt 0 ]; do
    case "$1" in
	--help)
            print_help;
            exit 0
            ;;
        --font-dir)
            fontdir="$2"
            shift 2
            ;;
        --width)
            width="$2"
            shift 2
            ;;
        --figlet-cmd)
            figcmd="$2"
            shift 2
            ;;
        --out-file-prefix)
            out_to_files_prefix="$2"
            shift 2
            ;;
        --out-file)
            out_to_file="$2"
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

if [ -n "$figcmd" ]; then
  echo "setting alt figlet cmd"
  exit 1
  FIGLETCMD="$figcmd"
fi

counter=0

if [ -n "$fontdir" ]; then
  echo "Setting alt fontdir"
  font_directory="$fontdir"
else
  font_directory="$HOME/figlet-fonts/collection/"
fi

for fontname in $font_directory*.flf(:t:r); do;
  if [ -n "$out_file_prefix" ]; then
    $FIGLETCMD -d $font_directory -w $width  -f $fontname $text > $out_file_prefix$counter.asc
  elif [ -n "$out_file" ]; then
    $FIGLETCMD -d $font_directory -w $width  -f $fontname $text >> $out_file
  else
    echo "=============================================================================="
#    echo "$fontname"
    echo $FIGLETCMD  -d $font_directory -w $width  -f $fontname $text
    echo "------------------------------------------------------------------------------"
    $FIGLETCMD  -d $font_directory -w $width  -f $fontname $text
    echo "------------------------------------------------------------------------------"
  fi
  ((counter++))
done




