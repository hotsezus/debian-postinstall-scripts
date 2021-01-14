wget --show-progress -qO- https://github.com/telegramdesktop/tdesktop/releases/download/v2.5.1/tsetup.2.5.1.tar.xz | sudo tar xJ -C /opt/ &&
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop &&
telegram-desktop > /dev/null 2>&1
