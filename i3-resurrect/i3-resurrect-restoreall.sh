#!/bin/bash

for f in ~/.i3/i3-resurrect/*layout.json

do
  firstline=$(head -n 1 $f)
  if [ $firstline != '{}' ] && [ $firstline != '[]' ]
  then
    IFS='_'
    read -ra splitdirname <<< "${f}"
    i3-resurrect restore -w ${splitdirname[1]}
    IFS=''
  fi
done
