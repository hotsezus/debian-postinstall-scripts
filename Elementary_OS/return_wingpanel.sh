RELEASE_VERSION="$(lsb_release -rs)"

sudo apt install -y --no-install-recommends software-properties-common libindicator3-7

if $RELEASE_VERION <> '6'; then
	sudo add-apt-repository -r -y ppa:bluesabre/elementary-odin
	sudo apt remove -y indicator-application com.github.lafydev.wingpanel-indicator-ayatana
	wget https://github.com/Lafydev/wingpanel-indicator-ayatana/raw/master/com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_odin.deb
	sudo dpkg -i com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_odin.deb
else
	wget https://github.com/Lafydev/wingpanel-indicator-ayatana/raw/master/com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_amd64.deb
	sudo dpkg -i com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_amd64.deb
	sudo apt install -y --no-install-recommends indicator-application
	echo '.composited-indicator {' | tee -a $HOME/.config/gtk-3.0/gtk.css
	echo '    padding: 0 3px;' | tee -a $HOME/.config/gtk-3.0/gtk.css
	echo '}' | tee -a $HOME/.config/gtk-3.0/gtk.css
fi

mkdir -p ~/.config/autostart
cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/
sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop
pkill -f io.elementary.wingpanel
