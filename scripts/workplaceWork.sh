#!/bin/bash

# Open Spotify
open -a "Spotify"

# Open Zed
open -a "Zed"

# Absolute path to the URLs file
URLS_FILE="/Users/yourusername/switching_places_script/scripts/urls.txt"

# Open Arc with URLs from urls.txt
while IFS= read -r url; do
    open -a "Arc" --args "$url"
done < "$URLS_FILE"

# Open Slack
open -a "Slack"

# Open Mails
open -a "Mail"

# Open OrbStack
open -a "OrbStack"
