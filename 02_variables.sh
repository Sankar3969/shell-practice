#! bin/bash
person1="Sankar"
person2="ram"

echo "$person1 is new to devops"
echo "$person2 is already know devops"

person1=$1
person2=$2

echo "please enter your first name ${person1}"
echo "please enter your second name ${person2}"

fruits=("Apple" "graps" "banana")

echo "the first one on the fruits list is ${fruits[0]}"
echo "the first one on the fruits list is ${fruits[1]}"
echo "the first one on the fruits list is ${fruits[2]}"
echo "the first one on the fruits list is ${fruits[@]}"

echo "please enter your the username"
read  Username
echo "the first Username is $Username"

echo "please enter your the password"
read  password
echo "the password is $password"

echo "please enter your the username without display"
read -s Username
echo "the first Username is $Username"

echo "please enter your the password without display"
read -s password
echo "the password is $password"