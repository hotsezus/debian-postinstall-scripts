echo "IntelliJ IDEA Installation"

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_TAR" 'https://download-cf.jetbrains.com/idea/ideaIU-2019.2.tar.gz' &&
tar -zxvf ideaIU-*.tar.gz -C /opt/
rm -f "$TEMP_TAR"
/opt/idea-*/bin/idea.sh
