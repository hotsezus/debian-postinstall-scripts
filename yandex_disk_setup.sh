echo "Yandex.Disk CLI Installation"
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

echo "Adding repository for Yandex.Disk GUI"
sudo add-apt-repository ppa:slytomcat/ppa

echo "Installing dependencies"
sudo apt-get install xclip gir1.2-appindicator3-0.1 python-appindicator

echo "Installing Yandex.Disk GUI"
sudo apt-get install yd-tools
