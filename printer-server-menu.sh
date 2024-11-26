#!/data/data/com.termux/files/usr/bin/bash
cd ~/print-server

clear
echo "Print Server Management"
echo "----------------------"
echo "1. Check Status"
echo "2. Update Server"
echo "3. Restart Server"
echo "4. View Logs"
echo "5. Exit"
echo

read -p "Choose an option: " choice

case $choice in
  1)
    clear
    pm2 status print-server
    ;;
  2)
    clear
    ./update.sh
    ;;
  3)
    clear
    pm2 restart print-server
    ;;
  4)
    clear
    pm2 logs print-server --lines 50
    ;;
  5)
    exit 0
    ;;
  *)
    echo "Invalid option"
    ;;
esac

echo
echo "Press enter to exit"
read