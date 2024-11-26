#!/bin/bash

# Run switchWork.sh script
SWITCH_WORK_SCRIPT="/Users/orangebroom/switching_places_script/scripts/switchHome.sh"
if [ -f "$SWITCH_WORK_SCRIPT" ]; then
    echo "Running switchWork.sh script..."
    bash "$SWITCH_WORK_SCRIPT"
else
    echo "switchWork.sh script not found at $SWITCH_WORK_SCRIPT"
fi

# Open Spotify
open -a "Spotify"

# Open Zed
open -a "Zed"

# Open Arc
open -a "Arc" --args "https://github.com/Orange4Broom"
