#!/data/data/com.termux/files/usr/bin/bash

# Wait for network
sleep 10

# Navigate to your print server directory
cd ~/print-server

# Start PM2
pm2 start ecosystem.config.js