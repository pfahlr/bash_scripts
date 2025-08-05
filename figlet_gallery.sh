#!/bin/zsh
# $1 = fonts directory $2 = string to process (in quotes if contains whitespace) $3 = max output width
FIGLETCMD="toilet"
cd $1
for i in `print -rl -- *.flf(:r)`; do; 
  echo "=============================================================================="
  echo "$i" 
  echo "------------------------------------------------------------------------------"
  $FIGLETCMD -d $1 -w $3 -f $i $2 
  echo "------------------------------------------------------------------------------"
done
cd -




