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

echo " the values from mapfile array first value ${output_array[0]}"
echo " the values from mapfile array  second value ${output_array[1]}"

readarray -t output_array1 < <(install_Status1 $1)
echo " the values from readarry first value ${output_array[0]}"
echo " the values from readarry array  second value ${output_array[1]}"

IFS=$'\n' read -r -d '' -a status_arry <<< "$status1"
echo " the values from new array first value ${status_arry[0]}"
echo " the values from new array second  value  ${status_arry[1]}"

readarray -t readarray2 <<< "$status1"
echo " the values from readarray2 first value ${readarray2[0]}"
echo " the values from readarray2 second  value  ${readarray2[1]}"
# for loop 
for element in "${status_arry[@]}";
do
echo " The status_arry  from for loop is "$element" "
done 


 install_Status1 $1 | while IFS= read -r line;
 do 
 
 val2="$line"
  if [[ $val2 == *"value"* ]]
  then  
    echo "output matched from valueee $val2"
  fi
 #echo "the value1: $status1"
done
#while example
index=0
echo " This is size of the array is ${#status_arry[@]} "
while [ $index -lt ${#status_arry[@]} ]
do 
echo " This is from  while loop "${status_arry[$index]}" "
((index++))
done

#while example 2

while IFS= read -r line;
do
echo "the reading the while loop 2 is "$line" "

done <<< "${status_arry[@]}"