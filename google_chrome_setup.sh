echo "Google Chrome Installation"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "\n# Google Chrome PPA" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb [arch=amd64] https://dl-ssl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y
