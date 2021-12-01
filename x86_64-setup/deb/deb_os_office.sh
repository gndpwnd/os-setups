#!/bin/bash
mkdir /opt/server

#networking
sudo echo "nameserver 1.1.1.1" > /etc/resolv.conf
sudo echo "nameserver 1.0.0.1" >> /etc/resolv.conf

sudo apt update && sudo apt install -fy curl wget python3 python3-pip
curl https://sh.rustup.rs -sSf | sh
wget https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -O get-platformio.py
python3 get-platformio.py
rm -rf get-platformio.py
sudo apt update && sudo apt upgrade -y
sudo apt install -fy vim snap gparted build-essential libelf-dev linux-headers-`uname -r` bc dkms \ 
                     apt-transport-https xclip terminator thunderbird libreoffice \
                     libgconf-2-4 libappindicator1 libc++1 adb \
                     git docker.io iperf3 speedtest-cli golang \
                     
                     
sudo snap install ao spotify vlc discord cherrytree cura-slicer rpi-imager
sudo snap install blender --channel=2.79/stable --classic
sudo snap install sublime-text --classic
sudo snap install code --classic
 
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder

wget http://ftp.osuosl.org/pub/ubuntu/pool/multiverse/f/fdk-aac/libfdk-aac1_0.1.6-1_amd64.deb
sudo dpkg -i libfdk-aac1_0.1.6-1_amd64.deb
rm -rf libfdk-aac1_0.1.6-1_amd64.deb

#obs-studio
sudo apt install ffmpeg-y
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio
  
#wireless drivers
#apt install -fy build-essential libelf-dev linux-headers-`uname -r` bc dkms
#apt install -fy realtek-rtl88xxau-dkms
cd /opt
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
sudo make && sudo make install
cd /opt/

sudo apt --fix-broken install

#Download
x-www-browser https://www.realvnc.com/en/connect/download/viewer/
x-www-browser https://obsidian.md/download

chmod -R 777 /opt/

