#!/bin/bash

# Färger
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# GitHub repository base URL
REPO_URL="https://raw.githubusercontent.com/Clementinose/thinkpad/main"

# Function to run scripts from GitHub or locally
run_script_github() {
    local script_path="$1"
    local script_name="$2"
    
    # Try local first, fall back to GitHub
    if [ -f "$script_path" ]; then
        bash "$script_path"
    else
        echo -e "${BLUE}Downloading $script_name from GitHub...${RESET}"
        bash <(curl -fsSL "$REPO_URL/$script_path")
    fi
}

# Clear screen
clear

# Banner Clements Inc.
echo -e "${CYAN}"
echo "   _____   _                                     _                 _                    "
echo "  / ____| | |                                   | |               (_)                   "
echo " | |      | |   ___   _ __ ___     ___   _ __   | |_   ___         _   _ __     ___     "
echo " | |      | |  / _ \ | '_ \` _ \   / _ \ | '_ \  | __| / __|       | | | '_ \   / __|    "
echo " | |____  | | |  __/ | | | | | | |  __/ | | | | | |_  \__ \       | | | | | | | (__   _ "
echo "  \_____| |_|  \___| |_| |_| |_| \___| |_| |_|  \__| |___/       |_| |_| |_|  \___| (_)"
echo -e "${RESET}"
echo ""

# Menyalternativ
echo -e "${GREEN}1)${RESET} Update system"
echo -e "${GREEN}2)${RESET} App selection"
echo -e "${RED}3)${RESET} Exit"
echo ""

# Läs användarval
read -p "$(echo -e ${YELLOW}Välj ett alternativ: ${RESET})" choice

# Kör användarval
case "$choice" in
  1) run_script_github "scripts/system/update_system.sh" "System Update" ;;
  2) run_script_github "scripts/apps/selection_apps.sh" "App Selection" ;;
  3) echo -e "${RED}👋 Hej då${RESET}" ; exit 0 ;;
  *) echo -e "${RED}❌ Fel val${RESET}" ;;
esac
