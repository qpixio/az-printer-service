#!/data/data/com.termux/files/usr/bin/bash
cd ~/print-server
echo "Print Server Status:"
echo "-------------------"
pm2 status print-server
echo "Press enter to exit"
read