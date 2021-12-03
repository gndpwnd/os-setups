#!/bin/bash

#get info
read -p "Username 4 this box: " uboi
echo "default no..."
read -p 'Need repo? y/n>  ' repo
echo "default no..."
read -p 'Need to prep file sys? y/n> ' fisys
echo 'keep in mind the default for this answer is yes...'
read -p 'Full Install? y/n> ' full


if [ $fisys == "y" ]
then
  cp -r pwnnotes/ /opt
  chmod 777 /opt/pwnnotes/setup.sh
  bash /opt/pwnnotes/setup.sh
  echo 'moving to /opt'
  #init
  sudo chmod 777 /opt
  mkdir /opt/server
  sudo mkdir /ctf
  sudo mkdir /thm
  sudo mkdir /htb
  sudo chmod 777 /opt/server
  sudo chmod 777 /ctf
  sudo chmod 777 /htb
  sudo chmod 777 /thm
  
  #networking
  sudo echo "nameserver 1.1.1.1" > /etc/resolv.conf
  sudo echo "nameserver 1.0.0.1" >> /etc/resolv.conf

  #setting resolution of display
  touch /opt/screenres.sh
  echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync' > /opt/screenres.sh
  echo 'xrandr --addmode Virtual1 1920x1080' >> /opt/screenres.sh
  echo 'xrandr --output Virtual1 --mode 1920x1080' >> /opt/screenres.sh
  chmod +x /opt/screenres.sh
  bash /opt/screenres.sh
else
 echo "No changes to your file sys"
fi

if [ $repo == "y" ]
then
  echo 'adding apt repo'
  #repo
  #echo "" > /etc/apt/sources.list
  wget -q -O - archive.kali.org/archive-key.asc | apt-key add
  echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
  apt-get update
  apt install snapd
else 
  echo "No changes to your repositories"
fi

echo "OK, Installing Tools"
  
####################################################################################################
#                                                APT
####################################################################################################
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder

sudo apt install -y firefox
sudo apt install -y chromium-browser
sudo apt install -y firefox-esr
sudo apt install -y chromium

sudo apt update --fix-missing
sudo apt --fix-broken install

sudo apt install -fy sqlitebrowser golang nasm default-jdk terminator git docker.io \
                       cherrytree wireshark python3 python3-pip sqlitebrowser golang terminator openvpn gnome-tweaks \
                       audacity exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh audacity bloodhound \
                       tor torbrowser-launcher nmap masscan exploitdb armitage set dsniff nikto osrframework recon-ng \
                       netdiscover legion voiphopper zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 \
                       reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps burpsuite \
                       dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife \
                       powersploit backdoor-factory veil-evasion bettercap beef-xss rtpflood \
                       crunch hash-identifier john johnny rainbowcrack hashcat arduino powershell-empire starkiller \
                       adb git docker.io iperf3 speedtest-cli vlc 

sudo usermod -aG docker $USER

sudo apt update --fix-missing
sudo apt --fix-broken install
####################################################################################################
#                                              PIP
####################################################################################################
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt update --fix-missing
sudo apt --fix-broken install

sudo python3 -m pip install --upgrade

pip3 install bloodhound pyinstaller pynput==1.6.8
####################################################################################################
#                                              SNAP
####################################################################################################
sudo snap install code --classic
snap install sublime-text --classic
####################################################################################################
#                                              GIT
####################################################################################################
#Responder
git clone https://github.com/SpiderLabs/Responder.git

#unicorn
git clone https://github.com/trustedsec/unicorn.git

#urh
git clone https://github.com/jopohl/urh.git

#linpeas
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
mkdir peas
mv privilege-escalation-awesome-scripts-suite/* peas/
rm -rf privilege-escalation-awesome-scripts-suite/
cp peas/linPEAS/linpeas.sh /opt/server/
cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

#PSEmpire
git clone https://github.com/EmpireProject/Empire.git

#ILSpy decompiler
git clone https://github.com/icsharpcode/ILSpy.git

#poor mans pentest
git clone https://github.com/JohnHammond/poor-mans-pentest.git
mkdir pmp
mv poor-mans-pentest/* pmp/
rm -rf poor-mans-pentest

#dirsearch
git clone https://github.com/maurosoria/dirsearch.git

#photon
git clone https://github.com/s0md3v/Photon.git

#rphp
git clone https://github.com/pentestmonkey/php-reverse-shell.git 
mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
rm -rf php-reverse-shell

#SecLists
git clone https://github.com/danielmiessler/SecLists.git

#evil limiter
git clone https://github.com/bitbrute/evillimiter.git

#GitTools
git clone https://github.com/internetwache/GitTools


#RsaCtfTool
git clone https://github.com/Ganapati/RsaCtfTool.git

####################################################################################################
#                                          CURL / WGET
####################################################################################################
#phoninfoga
curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
mv ./phoneinfoga /usr/bin/phoneinfoga

#hopper
wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
dpkg -i Hopper-v4-4.7.1-Linux.deb
rm -rf Hopper-v4-4.7.1-Linux.deb

#pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
mv pspy32 /opt/server/
mv pspy64 /opt/server/

#linenum
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
mv LinEnum.sh /opt/server/linenum.sh

#kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 /usr/bin/kerbrute

#rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
dpkg -i rustscan_2.0.1_amd64.deb
rm -rf rustscan_2.0.1_amd64.deb

#bloodhound
#defaul creds - neo4j:neo4j - need to change

#ghidra
wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
unzip ghidra_9.2.2_PUBLIC_20201229.zip
rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
mkdir ghidra
mv ghidra_9.2.2_PUBLIC/* ghidra/
rm -rf ghidra_9.2.2_PUBLIC/

#nmap standalone
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap
mv nmap /opt/server/

#impacket
wget https://github.com/SecureAuthCorp/impacket/releases/download/impacket_0_9_23/impacket-0.9.23.tar.gz
gunzip impacket-0.9.23.tar.gz
tar -xvf impacket-0.9.23.tar
rm -rf impacket-0.9.23.tar

####################################################################################################
#                                                 OTHER
####################################################################################################
#evil-winrm
gem install evil-winrm

#wireless drivers
sudo apt install -y build-essential libelf-dev linux-headers-`uname -r`
sudo apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
sudo make && sudo make install
reboot now
