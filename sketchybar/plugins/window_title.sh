#!/bin/bash

APP_NAME=$(yabai -m query --windows --window | jq '.app' | sed -E 's/^"(.*)"$/\1/')
WINDOW_TITLE=$(yabai -m query --windows --window | jq '.title' | sed -E 's/^"(.*)"$/\1/')
TEST=$(yabai -m query --windows --window | jq '.title' | sed -E 's/^"(.*)"$/\1/')

# The logic here could be improved, sometimes there is no app or title string. 
# This defaults to the last shown. 
# if [[ $WINDOW_TITLE = "" ]]; then
#   sketchybar -m set title label "$APP_NAME"
# else
#   if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
#     WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
#     sketchybar -m set title label "$WINDOW_TITLE"…
#   else
#     sketchybar -m set title label "$WINDOW_TITLE"
#   fi
# fi
sketchybar -m set title label "$TEST"
