#!/bin/bash
#

set -e

str1="This is the string"
str2="Another string"
varName=str1
echo ${!varName}  # "This is the string"
echo ${!str*}     # str1 str2

exit 99

str1="String 1"
str2="String 2"
str3=""
num1=1001
num2=2002

if [[ $str1 == $str2 ]]; then
    echo str1 equals str2
else
    echo str1 not equal ro str2
fi

# quotes are needed to make sure str1 and str2 are each seen 
# as a single string
# if [ $str1 = $str2 ]; then  ### ERROR due to spaces in str1 and str2
if [ "$str1" = "$str2" ]; then
    echo str1 equals str2
else
    echo str1 not equal ro str2
fi

ex_num=1
# Matching sub-strings
subStr="find me"
longStr="Can you find me?"

echo -e "\nExample $ex_num"; ex_num=$(( $ex_num + 1 ))
if [[ "$longStr" == *"$subStr"* ]] ; then
    echo 'Found :-)'
else
    echo 'Not found :-('
fi

echo -e "\nExample $ex_num"; ex_num=$(( $ex_num + 1 ))
if [[ "$longStr" == *"$subStr"* ]] ; then
    echo 'Found :-)'
else
    echo 'Not found :-('
fi

## This does not work since it compares:
#  'Can you find me?' to '*find me*'
echo -e "\nExample $ex_num"; ex_num=$(( $ex_num + 1 ))
if [ "$longStr" = *"$subStr"* ] ; then
    echo 'Found :-)'
else
    echo 'Not found :-('
fi

echo -e "\nExample $ex_num"; ex_num=$(( $ex_num + 1 ))
if [[ "$longStr" =~ *"$subStr"* ]] ; then
    echo 'Found :-)'
else
    echo 'Not found :-('
fi

# Ignore case
string='Welcome to the world of BASH scripting!'
substring='bash scripting'
echo -e "\nExample $ex_num"; ex_num=$(( $ex_num + 1 ))
if [[ ${string,,} = *${substring,,}* ]]; then
    echo 'Substring found!'
else
    echo 'Substring not found!'
fi



stringZ=abcABC123ABCabc
echo ${#stringZ}                 # 15
echo `expr length $stringZ`      # 15
echo `expr "$stringZ" : '.*'`    # 15


str=012345abcdef
echo "Substring ${str:3:5}"
