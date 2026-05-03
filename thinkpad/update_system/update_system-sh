#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${CYAN}    🔄 System Update & Upgrade${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${YELLOW}⚠️  This script requires root privileges.${RESET}"
   echo -e "${BLUE}Running with sudo...${RESET}"
   sudo "$0"
   exit $?
fi

echo -e "${GREEN}✓ Running as root${RESET}"
echo ""

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo -e "${RED}❌ Could not detect Linux distribution${RESET}"
    exit 1
fi

echo -e "${BLUE}▶ Detected: $PRETTY_NAME${RESET}"
echo ""

# Update based on distribution
case "$OS" in
    ubuntu|debian)
        echo -e "${BLUE}▶ Updating package lists...${RESET}"
        apt update
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Update failed${RESET}"
            exit 1
        fi
        
        echo -e "${BLUE}▶ Upgrading packages...${RESET}"
        apt upgrade -y
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Upgrade failed${RESET}"
            exit 1
        fi
        
        echo -e "${BLUE}▶ Removing unused packages...${RESET}"
        apt autoremove -y
        apt autoclean -y
        ;;
        
    fedora)
        echo -e "${BLUE}▶ Updating system...${RESET}"
        dnf update -y
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Update failed${RESET}"
            exit 1
        fi
        ;;
        
    arch|manjaro)
        echo -e "${BLUE}▶ Updating system...${RESET}"
        pacman -Syu --noconfirm
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Update failed${RESET}"
            exit 1
        fi
        ;;
        
    *)
        echo -e "${RED}❌ Unsupported distribution: $OS${RESET}"
        echo -e "${YELLOW}Please run updates manually for your system${RESET}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}✓ System update complete!${RESET}"
echo ""
