#!/bin/bash

gsettings set org.pantheon.desktop.gala.appearance button-layout :minimize,maximize,close
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,maximize,close
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/DecorationLayout': <':minimize,maximize,close'>, 'Gtk/DialogsUseHeader': <0>, 'Gtk/ShellShowsAppMenu': <0>}"
