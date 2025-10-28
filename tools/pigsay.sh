#!/bin/bash

a="< $@ >"

l=""
for ((i=0; i<$(echo -n $a | wc -c); i++)); do
    l="-"$l
done

echo $l
echo $a
echo $l

cat $(dirname $(realpath $0))"/data/pig"$((RANDOM % 4 + 1)) 
