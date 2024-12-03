#!/bin/bash

# Path to the configuration file
CONFIG_FILE="/Users/orangebroom/switching_places_script/wifi_config.txt"

# Get the current Wi-Fi network name
CURRENT_WIFI=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

# # Function to change IP address
# change_ip() {
#     local wifi_name=$1
#     local ip_address=$2
#     local router_address=$3

#     echo "Changing IP address for Wi-Fi network: $wifi_name to $ip_address with router $router_address"
#     sudo networksetup -setmanual "Wi-Fi" $ip_address 255.255.255.0 $router_address
# }

# # Read the configuration file and change IP address based on the current Wi-Fi network
# while IFS= read -r line; do
#     wifi_name=$(echo $line | awk -F'"' '{print $2}')
#     ip_address=$(echo $line | awk '{print $3}')
#     router_address=$(echo $line | awk '{print $4}')

#     if [ "$CURRENT_WIFI" == "$wifi_name" ]; then
#         change_ip "$wifi_name" "$ip_address" "$router_address"
#         break
#     fi
# done < "$CONFIG_FILE"

# Run switchWork.sh script
SWITCH_WORK_SCRIPT="/Users/orangebroom/switching_places_script/scripts/switchWork.sh"
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

# Absolute path to the URLs file
URLS_FILE="/Users/orangebroom/switching_places_script/urls.txt"

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
