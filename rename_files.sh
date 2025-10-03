#!/bin/bash

counter=0

for file in `ls | grep "\.md$"`; do
 echo $counter
 display_counter=$(printf "%0$2d\n" "$counter") 
 new_filename="$1${display_counter}_${file}" 
 echo $new_filename
 ((counter++))
done



