sudo add-apt-repository ppa:yunnxx/elementary
sudo apt install -y --no-install-recommends indicator-application wingpanel-indicator-ayatana rpl
sudo rpl "OnlyShowIn=Unity;GNOME;" "OnlyShowIn=Unity;GNOME;Pantheon;" /etc/xdg/autostart/indicator-application.desktop
sudo cp /usr/lib/systemd/user/indicator-application.service /etc/systemd/user
sudo su -c "echo -e '[Desktop Entry]\nName[ru]=Пользовательская команда\nComment[ru]=Системный трей\nExec=systemctl --user start indicator-application.service\nIcon=application-default-icon\nX-GNOME-Autostart-enabled=true\nType=Application' >> test.txt"
sudo rpl "padding: 0 6px;" "padding: 0 2px;" /usr/share/themes/elementary/gtk-3.0/apps.css
