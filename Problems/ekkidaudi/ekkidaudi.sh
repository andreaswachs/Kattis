#!/usr/bin/env bash

read a
read b 

# Remove newlines
a=$(echo $a | tr -d '\n')
b=$(echo $b | tr -d '\n')

printf "%s%s" "$(echo $a | cut -d '|' -f 1)" "$(echo $b | cut -d '|' -f 1)"
printf " %s%s\n" "$(echo $a | cut -d '|' -f 2)" "$(echo $b | cut -d '|' -f 2)"
