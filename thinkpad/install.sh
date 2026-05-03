#!/bin/bash

# One-liner installer for ThinkPad System Management Toolkit

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo -e "${BLUE}Installing ThinkPad System Management Toolkit...${RESET}"

# Clone or update the repository
REPO_URL="https://github.com/Clementinose/thinkpad.git"
INSTALL_DIR="$HOME/thinkpad"

if [ -d "$INSTALL_DIR" ]; then
    echo -e "${BLUE}Updating existing installation...${RESET}"
    cd "$INSTALL_DIR"
    git pull
else
    echo -e "${BLUE}Cloning repository...${RESET}"
    git clone "$REPO_URL" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Set permissions
echo -e "${BLUE}Setting permissions...${RESET}"
chmod +x menu.sh scripts/system/*.sh scripts/apps/*.sh

echo -e "${GREEN}✓ Installation complete!${RESET}"
echo ""
echo -e "${GREEN}To run the toolkit, use:${RESET}"
echo -e "${BLUE}cd ~/thinkpad && ./menu.sh${RESET}"
echo ""
echo -e "${GREEN}Or create an alias:${RESET}"
echo -e "${BLUE}echo 'alias thinkpad=\"~/thinkpad/menu.sh\"' >> ~/.bashrc${RESET}"
echo -e "${BLUE}echo 'alias thinkpad=\"~/thinkpad/menu.sh\"' >> ~/.zshrc${RESET}"
