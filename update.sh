#!/data/data/com.termux/files/usr/bin/bash

set -e  # Stop on error

APP_DIR="$HOME/print-server/az-printer-service"
ZIP_URL="https://github.com/qpixio/az-printer-service/archive/refs/heads/main.zip"
TMP_DIR="$HOME/az-printer-tmp"

echo "🔄 Updating az-printer-service..."

# Clean up any old temp
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "⬇️ Downloading latest repo ZIP..."
curl -L "$ZIP_URL" -o "$TMP_DIR/repo.zip"

echo "📦 Unzipping..."
unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"

echo "🧹 Removing old project folder..."
rm -rf "$APP_DIR"

echo "📁 Moving new project into place..."
mv "$TMP_DIR/az-printer-service-main" "$APP_DIR"

cd "$APP_DIR"

echo "📦 Installing dependencies..."
npm install

echo "🚀 Restarting PM2 process..."
pm2 restart all

echo "✅ Update complete!"
