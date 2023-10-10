#!/usr/bin/env bash
for i in {1..5};{ read a; echo $a | grep -q "FBI" && ans="$ans $i"; }
[[ -z $ans ]] && echo "HE GOT AWAY!" || echo ${ans}
