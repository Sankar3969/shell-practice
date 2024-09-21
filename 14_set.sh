#! bin/bash

set -e

failure (){

echo " the Failure on  $1:$2 "

}

trap ' failure "$LINENO" "$BASH_COMMAND" ' ERR

echo " correct command"
echoooo " in correct command"
echo " correct command again "
