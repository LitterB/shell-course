#!/bin/bash

my_array[0]=A
my_array[1]=B
my_array[2]=C
my_array[3]=D

echo "my_array's element is: ${my_array[*]}"
echo "my_array's element is: ${my_array[@]}"