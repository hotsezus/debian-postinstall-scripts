#!/bin/bash

echo "Disabling [Super + 0..9] dock switch-to-application shortcuts"
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false 2> /dev/null
for i in {1..9}; do gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]" ; done

echo "Enabling [Super + 0..9] switch-workspace shortcuts"
for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']" ; done

echo "Enabling [Super + Shift + 0..9] move-to-workspace shortcuts"
for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']" ; done
