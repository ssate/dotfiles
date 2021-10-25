# W I N D O W  T I T L E 
WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')

# if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')
# fi

# if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
#   WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
#   sketchybar -m --set title label=" $WINDOW_TITLE"…
#   exit 0
# fi


if [[ $WINDOW_TITLE != "" ]]; then
	# sketchybar -m --set title drawing=on
	sketchybar -m --set title label="$WINDOW_TITLE"
else
	# sketchybar -m --set title drawing=off
	sketchybar -m --set title label=None
fi
