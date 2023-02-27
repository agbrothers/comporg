#!/bin/bash


echo "TEST: Fahrenheit to Celsius"
./f2c <<< 95
echo " > correct answer 35"
./f2c <<< 32
echo " > correct answer 0"
./f2c <<< 0
echo " > correct answer -17\n\n"

echo "TEST: Celsius to Fahrenheit"
./c2f <<< 35
echo " > correct answer is 95"
./c2f <<< 0
echo " > correct answer is 32"
./c2f <<< -17
echo " > correct answer is 2\n\n"

echo "TEST: Positive to Negative"
./negative <<< 1
echo " > correct answer is -1"
./negative <<< 16
echo " > correct answer is -16"
./negative <<< 0
echo " > correct answer is 0\n\n"

echo "TEST: Convert feet and inch to inches only"
./ft2in <<< 5 4
echo " > correct answer is 64"
./ft2in <<< 0 0
echo " > correct answer is 0"
./ft2in <<< 1 -5
echo " > correct answer is 7\n\n"

echo "TEST: Convert inches to feet and inches"
./in2ft <<< 64
echo " > correct answer is 5ft 4in"
./in2ft <<< 0
echo " > correct answer is 0ft 0in"
./in2ft <<< 700
echo " > correct answer is 58ft 4in\n\n"

