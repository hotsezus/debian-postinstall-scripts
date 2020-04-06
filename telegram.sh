wget -O - https://github.com/telegramdesktop/tdesktop/releases/download/v2.0.1/tsetup.2.0.1.tar.xz | sudo tar xJ -C /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
telegram-desktop &
