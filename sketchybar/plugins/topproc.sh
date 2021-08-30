#!/usr/bin/env bash

TOPPROC=$(ps axo "%cpu,ucomm" | sort -nr | tail +1 | head -n1 | awk '{printf "%.0f%% %s\n", $1, $2}' | sed -e 's/com.apple.//g')
CPUP=$(echo $TOPPROC | sed -nr 's/([^\%]+).*/\1/p')

if [ $CPUP -gt 0 ]; then
  sketchybar -m set topproc label "異 $TOPPROC"
else
  sketchybar -m set topproc label ""
fi

