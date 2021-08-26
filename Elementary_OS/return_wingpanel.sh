RELEASE_VERSION="$(lsb_release -rs)"

sudo apt install -y --no-install-recommends software-properties-common libglib2.0-dev libgranite-dev libindicator3-dev 

if $RELEASE_VERION <> '6'; then
	sudo apt install -y --no-install-recommends libwingpanel-dev indicator-application
	wget https://github.com/Lafydev/wingpanel-indicator-ayatana/raw/master/com.github.lafydev.wingpanel-indicator-ayatana_2.0.8_odin.deb
	sudo dpkg -i com.github.lafydev.wingpanel-indicator-ayatana_2.0.8_odin.deb
else
	sudo apt install -y --no-install-recommends indicator-application libwingpanel-2.0-dev
	wget https://github.com/Lafydev/wingpanel-indicator-ayatana/raw/master/com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_amd64.deb
	sudo dpkg -i com.github.lafydev.wingpanel-indicator-ayatana_2.0.7_amd64.deb
	echo '.composited-indicator {' | tee -a $HOME/.config/gtk-3.0/gtk.css
	echo '    padding: 0 3px;' | tee -a $HOME/.config/gtk-3.0/gtk.css
	echo '}' | tee -a $HOME/.config/gtk-3.0/gtk.css
fi

mkdir -p ~/.config/autostart
cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/
sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop
pkill -f io.elementary.wingpanel
