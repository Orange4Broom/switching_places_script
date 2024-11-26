#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../colors.sh"
source "$SCRIPT_DIR/../config.sh"

git config --global --unset user.name || true
git config --global --unset user.email || true

echo -e "${CYAN}Přepínám na work git account${NC}"
git config --global user.name $WORK_USERNAME
git config --global user.email $WORK_EMAIL
echo -e "${GREEN}Přepnuto na work${NC}"

echo -e "${CYAN}Upravený Git Configuration:${NC}"
git config --list | grep 'user.name\|user.email' | head -n 2
