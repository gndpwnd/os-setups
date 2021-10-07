#!/bin/bash

                    #Configs
read -p "user for this box: " uboi 

mv configs/terminator /home/$uboi/.config/terminator/config
chown $uboi /home/$uboi/.config/terminator/config


apt install -fy build-essential libelf-dev linux-headers-`uname -r` bc dkms apt-transport-https terminator thunderbird libreoffice libgconf-2-4 libappindicator1 libc++1

cp -r pwnnotes/ /opt
chmod 777 /opt/pwnnotes/setup.sh
bash /opt/pwnnotes/setup.sh
echo 'moving to /opt'
#init
cd /opt
mkdir server
mkdir /ctf
mkdir /thm
mkdir /htb
  
#networking
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

  
#wireless drivers
#apt install -fy build-essential libelf-dev linux-headers-`uname -r` bc dkms
#apt install -fy realtek-rtl88xxau-dkms
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

#Thunderbird & Libre
#apt install -fy terminator thunderbird libreoffice

apt --fix-broken install

#Download
x-www-browser https://www.realvnc.com/en/connect/download/viewer/
x-www-browser https://discord.com/download
x-www-browser https://obsidian.md/download

chmod -R 777 /opt/

