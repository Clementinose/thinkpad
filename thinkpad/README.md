# ThinkPad System Management Toolkit

A comprehensive bash-based toolkit for managing Linux system updates and application installations.

## 📁 Folder Structure

```
thinkpad/
├── menu.sh                          # Main menu entry point
├── README.md                        # This file
└── scripts/                         # All scripts organized by category
    ├── system/                      # System-related scripts
    │   └── update_system.sh        # Update & upgrade system packages
    └── apps/                        # Application installation scripts
        └── selection_apps.sh       # Multi-app selection installer
```

## 🚀 Getting Started

### Prerequisites
- Linux system (Ubuntu, Debian, Fedora, Arch, Manjaro)
- Bash shell
- Internet connection (for some scripts)
- Root/sudo privileges (for installations)

### Running the Main Menu

**Super easy - just type:**
```bash
./menu.sh
```

**Or run directly from GitHub:**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Clementinose/thinkpad/main/menu.sh)
```

This will display the main menu with all available options:

1. **Update system** - Updates and upgrades all system packages
2. **App selection** - Install multiple applications at once
3. **Exit** - Close the menu

## 📋 Available Features

### 1. System Updates (`scripts/system/update_system.sh`)
Automatically detects your Linux distribution and applies the correct update commands:
- **Ubuntu/Debian**: `apt update` + `apt upgrade` + cleanup
- **Fedora**: `dnf update`
- **Arch/Manjaro**: `pacman -Syu`

**Usage:**
```bash
./scripts/system/update_system.sh
```

### 2. App Selection Installer (`scripts/apps/selection_apps.sh`)
Install any combination of the following applications:
- **Ghostty** - Terminal Emulator
- **VS Code** - Code Editor
- **Discord** - Chat Application
- **Spotify** - Music Streaming
- **Surfshark** - VPN Client
- **Brave Browser** - Web Browser
- **GNOME Extensions Manager** - GNOME Extensions

**Usage:**
```bash
./scripts/apps/selection_apps.sh
```

Then enter numbers separated by spaces (e.g., `1 2 6` to install Ghostty, VS Code, and Brave).

## 🔧 Customization

Each script is modular and can be run independently:

```bash
# Run system update directly
bash scripts/system/update_system.sh

# Run app installer directly
bash scripts/apps/selection_apps.sh
```

## ⚠️ Important Notes

- Most scripts require **root/sudo privileges** and will prompt for elevation
- Scripts automatically detect your Linux distribution
- All scripts provide colored output for better readability
- Error handling is built-in with clear error messages

## 🐛 Troubleshooting

If scripts don't execute:
1. Make sure they have execute permissions: `chmod +x scripts/*/`
2. Verify you're in the correct directory
3. Check that you have sudo/root access
4. Ensure your Linux distribution is supported

## 📝 Distribution Support

| Distribution | Update Manager | Status |
|-------------|----------------|--------|
| Ubuntu | apt | ✅ Supported |
| Debian | apt | ✅ Supported |
| Fedora | dnf | ✅ Supported |
| Arch | pacman | ✅ Supported |
| Manjaro | pacman | ✅ Supported |

## 📞 Support

For issues or questions about specific tools, check the comments in the individual scripts.

---

**Created by:** Clements Inc.  
**Last Updated:** May 2026