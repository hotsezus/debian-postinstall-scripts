sudo add-apt-repository ppa:yunnxx/elementary
sudo apt install -y --no-install-recommends indicator-application wingpanel-indicator-ayatana rpl
sudo rpl "OnlyShowIn=Unity;GNOME;" "OnlyShowIn=Unity;GNOME;Pantheon;" /etc/xdg/autostart/indicator-application.desktop
sudo cp /usr/lib/systemd/user/indicator-application.service /etc/systemd/user
echo '.composited-indicator {' | tee -a $HOME/.config/gtk-3.0/gtk.css
echo '    padding: 0 6px;' | tee -a $HOME/.config/gtk-3.0/gtk.css
echo '}' | tee -a $HOME/.config/gtk-3.0/gtk.css
sudo pkill wingpanel
