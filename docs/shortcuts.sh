#!/data/data/com.termux/files/usr/bin/bash

echo "🔄 Setting up startup shortcut..."
echo 'bash ~/print-server/az-printer-service/startup.sh' > ~/.shortcuts/StartupPrinter
chmod +x ~/.shortcuts/StartupPrinter

echo "🔄 Setting up update shortcut..."
echo 'bash ~/print-server/az-printer-service/update.sh' > ~/.shortcuts/UpdatePrinter
chmod +x ~/.shortcuts/UpdatePrinter

echo "🔄 Setting up status shortcut..."
echo 'bash ~/print-server/az-printer-service/check-status.sh' > ~/.shortcuts/StatusPrinter
chmod +x ~/.shortcuts/StatusPrinter