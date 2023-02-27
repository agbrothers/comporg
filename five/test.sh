#!/bin/bash


echo "TEST: Fahrenheit to Celsius"
./f2c <<< 95
echo " > correct answer 35"
./f2c <<< 32
echo " > correct answer 0"
./f2c <<< 0
echo " > correct answer -17"

echo "TEST: Celsius to Fahrenheit"
./c2f <<< 35
echo " > correct answer is 95"
./c2f <<< 0
echo " > correct answer is 32"
./c2f <<< -17
echo " > correct answer is 2"



