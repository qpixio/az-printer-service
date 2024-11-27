#!/data/data/com.termux/files/usr/bin/bash
cd ~/print-server/az-printer-service

echo "Restarting print server..."
pm2 restart print-server
echo "Press enter to exit"
read