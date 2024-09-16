#! bin/bash
DATE=$( date "+%F" )

echo "print the today  date $DATE"


Number1=$1
Number2=$2

SUM=$(($Number1+$Number2))

echo "The Number is $Number1 and $Number2  and $SUM"

if [ $SUM gt 500 ]
then
echo " The sum is greater than 100"
else
echo " the sum is less than 100"
fi