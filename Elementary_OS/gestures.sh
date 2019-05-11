sudo apt install git python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject wmctrl
mkdir tmp
cd tmp
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
libinput-gestures-setup autostart
cd ..
git clone https://gitlab.com/cunidev/gestures
cd gestures
sudo python3 setup.py install
cd ../../
sudo rm -R tmp
