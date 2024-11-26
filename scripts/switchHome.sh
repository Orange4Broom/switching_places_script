#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../colors.sh"
source "$SCRIPT_DIR/../config.sh"

echo -e "${CYAN}Přepínám na home git account${NC}"
git config --global user.name $HOME_USERNAME
git config --global user.email $HOME_EMAIL
echo -e "${GREEN}Přepnuto na home${NC}"
