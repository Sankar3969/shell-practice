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

 install_Status1 () {
 dnf list installed $1
 local value1=$?
 echo "the software value is :$value1 "
 echo $value1
 }
 status1=$(install_Status1 $1)

 install_Status1 $1 | while IFS= read -r line;
 do 
 
 val2="$line"
  if [[ "$line" -eq "1" ]]
  then  
    echo "output matched $val2"
  fi
 #echo "the value1: $status1"
done

# Function that prints a statement and returns an integer
my_function() {
  local value=42
  echo "This is a printed statement inside the function."
  return $value  # Return an integer (status code)
}

# Call the function
my_function

# Capture the return value (exit status)
result=$?

# Print the return value
echo "The returned value is: $result"
