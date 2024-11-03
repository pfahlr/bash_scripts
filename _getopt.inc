# BASH ARGUMENT PARSER 
# RICK PFAHL <pfahlr@gmail.com>
# 3 NOV 2024
#
# before including set $optstring to something like `ab:g:d: --long alpha,beta,gamma:,delta:`
# representing the options you'll use. 
#  
# TODO: MAKE IT HANDLE LONG OPTIONS

# Uncomment below to test with sample options:

##optstring="ab:g:d --long alpha,beta:,gamma:,delta:"

# I think I can move something reusable into this file?? idk. 
# echo "Testing _getopt"


VALID_ARGS=$(getopt -o "$optstring" --  "$@") 

if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"


# Mostly, I guess this will serve as some form of documentation. 
# I swore I read a better way to to do this... and of course forgot, maybe I'm just thinking
# of python. Or was it a zsh thing. fuck. who knows
#
# Anyway, in the file that includes this, you'll need a switch in a while loop
#
# Uncomment rest of file to test with sample options:
while [ : ]; do 
  case "$1" in 
    -a | --alpha)
        echo "Option -a, --alpha"
        shift
        ;;
    -b | --beta)
        echo "Option -b, --beta"
        echo "There should be a value in these braces: [ $2 ]"
        shift;shift;
        ;;
    -g | --gamma)
        echo "Option -g, --gamma"
        echo "There should be a value in these braces: [ $2 ]"
        shift;shift;
        ;;
    -d | --delta)
        echo "Option -d, --delta"
        echo "There should be a value in these braces: [ $2 ]"
        shift;shift;
        ;;
    --) shift;
        break
        ;;
  esac
done
     

