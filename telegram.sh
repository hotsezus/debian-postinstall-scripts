#!/bin/bash
MACHINE_TYPE=`uname -m`

# Removing old versions
echo 'Removing old versions'
sudo rm -Rf /opt/telegram* > /dev/null 2>&1
sudo rm -Rf /usr/bin/telegram > /dev/null 2>&1
sudo rm -Rf /usr/share/applications/telegram.desktop > /dev/null 2>&1

echo 'Identify Machine Type'
# Identify Machine Type
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	wget "https://telegram.org/dl/desktop/linux" -O /tmp/telegram.tar.xz
else
	wget "https://telegram.org/dl/desktop/linux32" -O /tmp/telegram.tar.xz
fi

# Extract the files
echo 'Extracting the files'
sudo tar Jxf /tmp/telegram.tar.xz -C /opt/ &&
sudo mv /opt/Telegram*/ /opt/telegram &&

# Create a shortcut on system
echo 'Creating symbol link'
sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&

echo 'Installation finish'
telegram-desktop > /dev/null 2>&1
