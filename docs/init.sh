#!/data/data/com.termux/files/usr/bin/bash

# Set faster package mirrors for Termux
echo "⚡ Configuring fast package mirrors..."
echo "deb https://packages.termux.dev/apt/termux-main stable main" > $PREFIX/etc/apt/sources.list.d/fast.list

echo "🔄 Cleaning up old Node.js/NVM installations..."
nvm deactivate >/dev/null 2>&1
nvm uninstall 18 >/dev/null 2>&1
nvm uninstall 16 >/dev/null 2>&1
nvm uninstall 14 >/dev/null 2>&1
rm -rf ~/.nvm ~/.npm ~/.pm2 ~/.bashrc
hash -r

echo "📦 Updating packages and installing prerequisites..."
# Use faster update with progress
pkg update -y --no-progress-bar && pkg upgrade -y --no-progress-bar
pkg install curl git unzip nodejs-lts -y --no-progress-bar

echo "🛠 Installing PM2 globally..."
if ! command -v pm2 &> /dev/null; then
    npm install -g pm2 --silent
    echo "✅ PM2 installed successfully"
else
    echo "✅ PM2 is already installed"
fi

echo "📁 Downloading az-printer-service..."
# Use faster download with progress and resume capability
curl -L -C - --progress-bar https://github.com/qpixio/az-printer-service/archive/refs/heads/main.zip -o repo.zip
unzip -q -o repo.zip -d ~/print-server

# Check if the destination folder already exists
if [ ! -d ~/print-server/az-printer-service ]; then
    echo "📁 Moving files to ~/print-server/az-printer-service..."
    mkdir -p ~/print-server
    mv az-printer-service-main ~/print-server/az-printer-service
    echo "✅ Files moved successfully"
else
    echo "📁 Updating existing az-printer-service folder..."
    cp -r az-printer-service-main/* ~/print-server/az-printer-service/
    echo "✅ Files updated successfully"
fi

cd ~/print-server/az-printer-service

echo "🚀 Running startup.sh inside az-printer-service..."
if [ -f startup.sh ]; then
  bash startup.sh
else
  echo "⚠️  No startup.sh found in the project folder. Please run it manually if needed."
fi

echo "🔄 Setting up update alias..."
chmod +x ~/print-server/az-printer-service/update.sh
echo 'alias printer-update="bash ~/print-server/az-printer-service/update.sh"' >> ~/.bashrc
source ~/.bashrc

# Clean up downloaded files
rm -f repo.zip
rm -rf az-printer-service-main

echo "✅ Done! You're ready to use the az-printer-service!"
