#!/usr/bin/env bash

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set $NAME background.color=0xff81a1c1
else
  sketchybar -m --set $NAME background.color=0xff57627A
fi
