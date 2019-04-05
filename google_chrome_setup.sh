echo "Google Chrome Installation"
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
