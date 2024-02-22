curl -s https://api.github.com/repos/telegramdesktop/tdesktop/releases/latest | grep "tsetup.*tar.xz" | cut -d : -f 2,3 | tr -d \" | wget -qi - | sudo tar xJ -C /opt/ &&
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop &&
telegram-desktop > /dev/null 2>&1
