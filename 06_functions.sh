#! bin/bash

#the function with return values exit code status and print the echo status code
install_Status () {
dnf list installed $1
local value=$?
echo " The installation status of  $1 is : $value"
return $value
}
install_Status $1
status=$?
echo "the value : $status"

# the function with return values with echo with no print statement
# reading the function values from while loop
 install_Status1 () {
 dnf list installed $1
 local value1=$?
 echo "the software value is mysql"
 echo $value1
 }
 status1=$(install_Status1 $1)
 #direct convertion from the function 
mapfile -t output_array < <(install_Status1 $1)
echo " the values from status array ${output_array[1]}"

IFS=$'\n' read -r -d '' -a status_arry <<< "$status1"
echo " the values from new array ${status_arry[1]}"
 install_Status1 $1 | while IFS= read -r line;
 do 
 
 val2="$line"
  if [[ $val2 == *"value"* ]]
  then  
    echo "output matched from valueee $val2"
  fi
 #echo "the value1: $status1"
done
