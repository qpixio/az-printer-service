#!/data/data/com.termux/files/usr/bin/bash

echo "🔄 Cleaning up old Node.js/NVM installations..."
nvm deactivate >/dev/null 2>&1
nvm uninstall 18 >/dev/null 2>&1
nvm uninstall 16 >/dev/null 2>&1
nvm uninstall 14 >/dev/null 2>&1
rm -rf ~/.nvm ~/.npm ~/.pm2 ~/.bashrc
hash -r

echo "📦 Updating packages and installing prerequisites..."
pkg update -y && pkg upgrade -y
pkg install curl git unzip nodejs-lts -y

echo "🛠 Installing PM2 globally..."
npm install -g pm2

echo "📁 Downloading az-printer-service..."
curl -L https://github.com/qpixio/az-printer-service/archive/refs/heads/main.zip -o repo.zip
unzip repo.zip
mkdir -p ~/print-server
mv az-printer-service-main ~/print-server/az-printer-service
cd ~/print-server/az-printer-service

echo "🚀 Running setup.sh inside az-printer-service..."
if [ -f setup.sh ]; then
  bash setup.sh
else
  echo "⚠️  No setup.sh found in the project folder. Please run it manually if needed."
fi

echo "✅ Done! You’re ready to use the az-printer-service!"
