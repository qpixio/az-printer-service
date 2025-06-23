#!/data/data/com.termux/files/usr/bin/bash

# Add npm global bin to PATH for PM2 access
export PATH="$PATH:$HOME/.npm-global/bin:$PREFIX/bin"

cd ~/print-server/az-printer-service
echo "Print Server Status:"
echo "-------------------"
$PREFIX/bin/pm2 status print-server
echo "Press enter to exit"
read