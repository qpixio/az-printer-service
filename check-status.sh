#!/data/data/com.termux/files/usr/bin/bash
cd ~/printer-server/az-printer-service
echo "Print Server Status:"
echo "-------------------"
pm2 status print-server
echo "Press enter to exit"
read