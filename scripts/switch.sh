#!/bin/bash
set -e

source ../colors.sh
source ../config.sh

echo -e "${CYAN}Současný Git Configuration:${NC}"
git config --list | grep 'user.name\|user.email' | head -n 2

echo -e "${CYAN}Vyber jestli chceš přepnout na work (w) nebo home (h)${NC}"
read -p ">" choise

# Unset existing values
git config --global --unset user.name || true
git config --global --unset user.email || true

if [[ $choise == "w" ]]; then
    echo -e "${CYAN}Přepínám na work${NC}"
    git config --global user.name $WORK_USERNAME
    git config --global user.email $WORK_EMAIL
    echo -e "${GREEN}Přepnuto na work${NC}"

elif [[ $choise == "h" ]]; then
    echo -e "${CYAN}Přepínám na home${NC}"
    git config --global user.name $HOME_USERNAME
    git config --global user.email $HOME_EMAIL
    echo -e "${GREEN}Přepnuto na home${NC}"
else
    echo -e "${RED}Invalid choice${NC}"
    exit 1
fi

echo -e "${CYAN}Upravený Git Configuration:${NC}"
git config --list | grep 'user.name\|user.email' | head -n 2
