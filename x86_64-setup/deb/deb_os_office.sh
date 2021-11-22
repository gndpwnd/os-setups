#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
wget https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -O get-platformio.py
python3 get-platformio.py
sudo apt update && sudo apt upgrade
sudo apt install -fy snap build-essential libelf-dev linux-headers-`uname -r` bc dkms apt-transport-https xclip terminator thunderbird libreoffice libgconf-2-4 libappindicator1 libc++1 git docker iperf3 speedtest-cli python3 python3-pip rust go 
sudo snap install ao spotify obs-studio vlc discord cherrytree
sudo snap install blender --channel=2.79/stable --classic
sudo snap install cura-slicer

mkdir /opt/server
  
#networking
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

  
#wireless drivers
#apt install -fy build-essential libelf-dev linux-headers-`uname -r` bc dkms
#apt install -fy realtek-rtl88xxau-dkms
cd /opt
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/

                    #office

#subl
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

sudo apt --fix-broken install

#Download
x-www-browser https://www.realvnc.com/en/connect/download/viewer/
x-www-browser https://obsidian.md/download

chmod -R 777 /opt/

