#!/data/data/com.termux/files/usr/bin/bash

echo "Pulling latest changes..."
git pull origin main

echo "Installing dependencies..."
npm install

echo "Restarting server..."
pm2 restart print-server

echo "Update complete!"