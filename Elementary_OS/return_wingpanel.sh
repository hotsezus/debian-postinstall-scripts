sudo add-apt-repository ppa:yunnxx/elementary
sudo apt install -y --no-install-recommends indicator-application wingpanel-indicator-ayatana rpl
sudo rpl "OnlyShowIn=Unity;GNOME;" "OnlyShowIn=Unity;GNOME;Pantheon;" /etc/xdg/autostart/indicator-application.desktop
sudo cp /usr/lib/systemd/user/indicator-application.service /etc/systemd/user
sudo rpl "padding: 0 6px;" "padding: 0 2px;" /usr/share/themes/*/*/*.css
sudo pkill wingpanel
