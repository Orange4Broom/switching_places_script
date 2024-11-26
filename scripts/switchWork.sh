#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../colors.sh"
source "$SCRIPT_DIR/../config.sh"

echo -e "${CYAN}Přepínám na work git account${NC}"
git config --global user.name $WORK_USERNAME
git config --global user.email $WORK_EMAIL
echo -e "${GREEN}Přepnuto na work${NC}"
