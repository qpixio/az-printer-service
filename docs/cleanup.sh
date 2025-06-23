#!/data/data/com.termux/files/usr/bin/bash

echo "🔄 Cleaning up old Node.js/NVM installations..."
nvm deactivate >/dev/null 2>&1
nvm uninstall 18 >/dev/null 2>&1
nvm uninstall 16 >/dev/null 2>&1
nvm uninstall 14 >/dev/null 2>&1
rm -rf ~/.nvm ~/.npm ~/.pm2 ~/.bashrc
hash -r