# Workplace Automation Script

This repository contains a script to automate the setup of your workplace environment. The script changes the IP address based on the Wi-Fi network you are connected to and opens various applications and URLs.

## Files

- `workplaceWork.sh`: The main script to automate the setup.
- `wifi_config.txt`: Configuration file containing Wi-Fi network names, IP addresses, and router addresses.
- `urls.txt`: File containing URLs to be opened in the Arc browser.

## Setup

1. **Clone the Repository**

   ```sh
   git clone https://github.com/yourusername/switching_places_script.git
   cd switching_places_script/scripts
   ```

2. **Create the Configuration Files**

   - Create `wifi_config.txt` with the following format:

     ```txt
     "Wifi name" ip_address router_address
     ```

   - Create `urls.txt` with the URLs you want to open, one per line:

     ```txt
      https://github.com/Orange4Broom
      https://www.example1.com
      https://www.example2.com

     ```

3. **Update the Script**

   Ensure the paths in `workplaceWork.sh` are correct:

   ```sh
   #!/bin/bash

   # Path to the configuration file
   CONFIG_FILE="/Users/yourusername/switching_places_script/scripts/wifi_config.txt"

   # Get the current Wi-Fi network name
   CURRENT_WIFI=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

   # Function to change IP address
   change_ip() {
       local wifi_name=$1
       local ip_address=$2
       local router_address=$3

       echo "Changing IP address for Wi-Fi network: $wifi_name to $ip_address with router $router_address"
       sudo networksetup -setmanual "Wi-Fi" $ip_address 255.255.255.0 $router_address
   }

   # Read the configuration file and change IP address based on the current Wi-Fi network
   while IFS= read -r line; do
       wifi_name=$(echo $line | awk -F'"' '{print $2}')
       ip_address=$(echo $line | awk '{print $3}')
       router_address=$(echo $line | awk '{print $4}')

       if [ "$CURRENT_WIFI" == "$wifi_name" ]; then
           change_ip "$wifi_name" "$ip_address" "$router_address"
           break
       fi
   done < "$CONFIG_FILE"

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
   ```

4. **Make the Script Executable**

   ```sh
   chmod +x workplaceWork.sh
   ```

5. **Run the Script**

   ```sh
   ./workplaceWork.sh
   ```

## Notes

- Ensure that the Wi-Fi network names, IP addresses, and router addresses in the `wifi_config.txt` file are correct.
- Replace `/Users/yourusername/switching_places_script/scripts/wifi_config.txt` and `/Users/yourusername/switching_places_script/scripts/urls.txt` with the actual paths to your configuration and URLs files.
- The `networksetup` command requires administrative privileges to change network settings, so you may be prompted to enter your password.
- The `en0` interface is typically used for Wi-Fi on macOS, but you can verify this by running `networksetup -listallhardwareports` and adjusting the script if necessary.
- The script sets a manual IP address with a subnet mask of `255.255.255.0`. Adjust this value as needed for your network configuration.
