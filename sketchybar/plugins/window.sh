#!/bin/zsh

# window title
data=$(yabai -m query --windows --window)

window_title=$(echo $data | jq -r '.title' \
    | sed 's/ - Eric (Person [[:digit:]])$//g' \
    | sed 's/ - Google Chrome$//g' \
    | sed 's/ - Audio playing$//g' \
    | sed 's/ - Camera or microphone recording$//g' \
    | sed 's/ - Part of group ..*$//g')

[ "${#window_title}" -gt 40 ] && window_title="$(echo $window_title | head -c 40)…"

# window properties

floating=$(echo $data | jq -r '.floating')
topmost=$(echo $data | jq -r '.topmost')
sticky=$(echo $data | jq -r '.sticky')
zoom_fullscreen=$(echo $data | jq -r '."zoom-fullscreen"')
zoom_parent=$(echo $data | jq -r '."zoom-parent"')

[ "$floating" = "1" ] && properties="${properties}~"
[ "$topmost" = "1" ] && properties="${properties}^"
[ "$zoom_fullscreen" = "1" ] && properties="${properties}f"
[ "$zoom_parent" = "1" ] && properties="${properties}p"
[ "$sticky" = "1" ] && properties="${properties}*"

if ! [ -z "$properties" ]; then
    [ -z "$window_title" ] && window_title="[$properties]" || window_title="$window_title [$properties]"
fi

# app name

app_name=$(echo $data | jq -r '.app')

[ "${#app_name}" -gt 20 ] && app_name="$(echo $app_name | head -c 20)…"

# setting items

sketchybar -m \
    --set app_name \
        label="$app_name" \
        drawing=$([ -z "$app_name" ] && echo off || echo on) \
    --set window \
        label="$window_title" \
        drawing=$([ -z "$window_title" ] && echo off || echo on)
