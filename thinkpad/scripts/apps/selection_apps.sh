#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Clear screen
clear

# Banner
echo -e "${CYAN}"
echo "   _____   _                                     _                 _                    "
echo "  / ____| | |                                   | |               (_)                   "
echo " | |      | |   ___   _ __ ___     ___   _ __   | |_   ___         _   _ __     ___     "
echo " | |      | |  / _ \ | '_ \` _ \   / _ \ | '_ \  | __| / __|       | | | '_ \   / __|    "
echo " | |____  | | |  __/ | | | | | | |  __/ | | | | | |_  \__ \       | | | | | | | (__   _ "
echo "  \_____| |_|  \___| |_| |_| |_| \___| |_| |_|  \__| |___/       |_| |_| |_|  \___| (_)"
echo -e "${RESET}"
echo ""
echo -e "${CYAN}═════════════════════════════════════════${RESET}"
echo -e "${CYAN}    📦 App Download & Installation${RESET}"
echo -e "${CYAN}═════════════════════════════════════════${RESET}"
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${YELLOW}⚠️  This script requires root privileges.${RESET}"
   echo -e "${BLUE}Running with sudo...${RESET}"
   sudo "$0"
   exit $?
fi

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

# Display app selection menu
echo -e "${GREEN}Select apps to install (enter numbers separated by spaces):${RESET}"
echo ""
echo -e "${GREEN}1)${RESET}  Ghostty (Terminal Emulator)"
echo -e "${GREEN}2)${RESET}  VS Code (Code Editor)"
echo -e "${GREEN}3)${RESET}  Discord (Chat)"
echo -e "${GREEN}4)${RESET}  Spotify (Music)"
echo -e "${GREEN}5)${RESET}  Surfshark (VPN)"
echo -e "${GREEN}6)${RESET}  Brave Browser"
echo -e "${GREEN}7)${RESET}  GNOME Extensions Manager"
echo -e "${RED}0)${RESET}  Exit"
echo ""

read -p "$(echo -e ${YELLOW}Enter your choices${RESET} (e.g., 1 2 3): )" choices

echo ""

# Initialize arrays
declare -a apps_to_install
declare -a packages_debian
declare -a packages_fedora
declare -a packages_arch

# Function to add package to install list
add_package() {
    local debian_pkg="$1"
    local fedora_pkg="$2"
    local arch_pkg="$3"
    
    packages_debian+=("$debian_pkg")
    packages_fedora+=("$fedora_pkg")
    packages_arch+=("$arch_pkg")
}

# Process user choices
for choice in $choices; do
    case "$choice" in
        1)
            apps_to_install+=("Ghostty")
            add_package "ghostty" "ghostty" "ghostty"
            ;;
        2)
            apps_to_install+=("VS Code")
            add_package "code" "code" "visual-studio-code-bin"
            ;;
        3)
            apps_to_install+=("Discord")
            add_package "discord" "discord" "discord"
            ;;
        4)
            apps_to_install+=("Spotify")
            add_package "spotify-client" "spotify-client" "spotify"
            ;;
        5)
            apps_to_install+=("Surfshark")
            add_package "surfshark" "surfshark" "surfshark"
            ;;
        6)
            apps_to_install+=("Brave Browser")
            add_package "brave-browser" "brave-browser" "brave-browser"
            ;;
        7)
            apps_to_install+=("GNOME Extensions Manager")
            add_package "gnome-shell-extension-manager" "gnome-shell-extension-manager" "gnome-shell-extension-manager"
            ;;
        0)
            echo -e "${RED}👋 Exiting${RESET}"
            exit 0
            ;;
        *)
            echo -e "${YELLOW}⚠️  Invalid choice: $choice${RESET}"
            ;;
    esac
done

# Check if any apps were selected
if [ ${#apps_to_install[@]} -eq 0 ]; then
    echo -e "${YELLOW}No apps selected${RESET}"
    exit 0
fi

echo -e "${BLUE}▶ Installing: ${apps_to_install[*]}${RESET}"
echo ""

# Install based on distribution
case "$OS" in
    ubuntu|debian)
        echo -e "${BLUE}▶ Updating package lists...${RESET}"
        apt update
        
        echo -e "${BLUE}▶ Installing packages...${RESET}"
        apt install -y "${packages_debian[@]}"
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Installation failed${RESET}"
            exit 1
        fi
        ;;
        
    fedora)
        echo -e "${BLUE}▶ Installing packages...${RESET}"
        dnf install -y "${packages_fedora[@]}"
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Installation failed${RESET}"
            exit 1
        fi
        ;;
        
    arch|manjaro)
        echo -e "${BLUE}▶ Installing packages...${RESET}"
        pacman -S --noconfirm "${packages_arch[@]}"
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Installation failed${RESET}"
            exit 1
        fi
        ;;
        
    *)
        echo -e "${RED}❌ Unsupported distribution: $OS${RESET}"
        echo -e "${YELLOW}Please install manually for your system${RESET}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}✓ Installation complete!${RESET}"
echo ""
