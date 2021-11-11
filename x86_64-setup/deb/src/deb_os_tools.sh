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
  cd /opt
  mkdir server
  mkdir /ctf
  mkdir /thm
  mkdir /htb

  #networking
  echo "nameserver 1.1.1.1" > /etc/resolv.conf
  echo "nameserver 1.0.0.1" >> /etc/resolv.conf

  #setting resolution of display
  touch screenres.sh
  echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync' > screenres.sh
  echo 'xrandr --addmode Virtual1 1920x1080' >> screenres.sh
  echo 'xrandr --output Virtual1 --mode 1920x1080' >> screenres.sh
  chmod +x screenres.sh
  bash screenres.sh
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

if [ $(full) == "n" ] 
then
  #apt init
  sudo apt install -fy python3 python3-pip sqlitebrowser golang nasm default-jdk terminator 
  #snap init
  sudo snap install code --classic
  sudo apt --fix-broken install
  #remote init
  wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.7.4-Linux-x64.deb -O vnc.deb
  dpkg -i vnc.deb
  rm -rf vnc.deb
  #programming language support
  sudo python3 -m pip install --upgrade pip

  echo "OK, Please choose you packages (y/n)..."
  read -p 'Net?> ' net
  read -p 'Recon?> ' recon
  read -p 'Enum?> ' enum
  read -p 'revfor?> ' revfor
  read -p 'Xploit?> ' xploit
  read -p 'Post?> ' post
  read -p 'Anon?> ' anon
  if [ $(net) == "n" ]
  then
  echo 'No net...'
  else
  sudo apt install -fy nmap masscan wireshark aircrack-ng wifite pixiewps bettercap clusterssh netdiscover reaver rtpflood
  sudo apt --fix-broken install
  
  #Responder
  git clone https://github.com/SpiderLabs/Responder.git
  
  #evil limiter
  git clone https://github.com/bitbrute/evillimiter.git
  
  fi
  if [ $(recon) == "n" ]
  then
  echo 'No recon...'
  else
  sudo apt install -fy recon-ng aircrack-ng rtlsdr-scanner gqrx-sdr osrframework legion dnsrecon thc-ipv6 uniscan ffuf
  sudo apt --fix-broken install								
  
  #rustscan
  wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
  dpkg -i rustscan_2.0.1_amd64.deb
  rm -rf /opt/rustscan_2.0.1_amd64.deb

  #unicorn
  git clone https://github.com/trustedsec/unicorn.git

  #urh
  git clone https://github.com/jopohl/urh.git

  #phoninfoga
  curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
  mv ./phoneinfoga /usr/bin/phoneinfoga

  #photon
  git clone https://github.com/s0md3v/Photon.git
  
  #goscan
  wget https://github.com/marco-lancini/goscan/releases/download/v2.4/goscan_2.4_linux_amd64.zip
  unzip goscan_2.4_linux_amd64.zip
  rm -rf goscan_2.4_linux_amd64.zip
  mv ./goscan /bin/goscan
  
  fi
  if [ $(enum) == "n" ]
  then
  echo 'No enum...'
  else
  sudo apt install -fy nikto voiphopper zaproxy burpsuite enum4linux dsniff dmitry dnstracer dirb dirbuster gobuster wpscan siparmyknife theharvester
  sudo apt --fix-broken install
  
  #linenum
  wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
  mv LinEnum.sh /opt/server/linenum.sh

  #kerbrute
  wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
  mv kerbrute_linux_amd64 /usr/bin/kerbrute

  #linpeas
  git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
  mkdir peas
  mv privilege-escalation-awesome-scripts-suite/* peas/
  rm -rf privilege-escalation-awesome-scripts-suite/
  cp peas/linPEAS/linpeas.sh /opt/server/
  cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git
  fi
  if [ $(revfor) == "n" ]
  then
  echo 'No revfor...'
  else
  sudo apt install -fy exiftool binwalk radare2 gdb audacity arduino
  sudo apt --fix-broken install
  
  #vscode
  sudo apt update
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt install code

  #hopper
  wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
  dpkg -i Hopper-v4-4.7.1-Linux.deb
  rm -rf Hopper-v4-4.7.1-Linux.deb

  #ghidra
  wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
  unzip ghidra_9.2.2_PUBLIC_20201229.zip
  rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
  mkdir ghidra
  mv ghidra_9.2.2_PUBLIC/* ghidra/
  rm -rf ghidra_9.2.2_PUBLIC/

  #ILSpy decompiler
  git clone https://github.com/icsharpcode/ILSpy.git
  fi
  if [ $(xploit) == "n" ]
  then
  echo 'No xploit...'
  else
  sudo apt install -fy exploitdb set sqlmap sqlninja websploit powersploit veil-evasion beef-xss

  #rphp
  git clone https://github.com/pentestmonkey/php-reverse-shell.git 
  mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
  rm -rf php-reverse-shell

  #pspy
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
  mv pspy32 /opt/server/
  mv pspy64 /opt/server/

  #PSEmpire
  git clone https://github.com/EmpireProject/Empire.git
  fi
  if [ $(post) == "n" ]
  then
  echo 'No post...'
  else
  sudo apt install -fy bloodhound wordlists backdoor-factory crunch hash-identifier john johnny rainbowcrack hashcat
  sudo apt --fix-broken install
  
  #bloodhound
  #defaul creds - neo4j:neo4j - need to change
  
  #SecLists
  git clone https://github.com/danielmiessler/SecLists.git
  
  fi
  if [ $(anon) == "n" ]
  then
  echo 'No anon...'
  else
  sudo apt install -fy openvpn tor torbrowser-launcher
  sudo apt --fix-broken install
  fi
  if [ $(cus) == "n" ]
  then
  echo 'No custom...'
  else
  sudo apt install -fy gnome-tweaks
  sudo apt --fix-broken install
  
  #subl
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text								

  #poor mans pentest
  git clone https://github.com/JohnHammond/poor-mans-pentest.git
  mkdir pmp
  mv poor-mans-pentest/* pmp/
  rm -rf poor-mans-pentest
  
  #cherrytree
  sudo apt install -y cherrytree
  fi
else
  echo "OK, installing all packages"
  
  #initial stuff
  sudo apt install -fy python2 python3 python3-pip sqlitebrowser golang nasm default-jdk terminator git docker
  sudo apt update --fix-missing
  sudo apt --fix-broken install
  
  
  sudo python3 -m pip install --upgrade 
  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
  sudo python2 get-pip.py
  sudo apt update --fix-missing
  sudo apt --fix-broken install 
  
  sudo apt install -fy cherrytree wireshark python3 python3-pip sqlitebrowser golang terminator openvpn gnome-tweaks audacity exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh audacity bloodhound tor torbrowser-launcher nmap masscan exploitdb armitage set dsniff nikto osrframework recon-ng netdiscover legion voiphopper zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps burpsuite dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife powersploit backdoor-factory veil-evasion bettercap beef-xss rtpflood crunch hash-identifier john johnny rainbowcrack hashcat arduino powershell-empire starkiller
  sudo apt update --fix-missing
  sudo apt --fix-broken install
  
  pip3 install bloodhound 
  
  #standalone py exe
  pip3 install pyinstaller
  pip3 install pynput==1.6.8
  
  snap install sublime-text --classic
  
  #goscan
  wget https://github.com/marco-lancini/goscan/releases/download/v2.4/goscan_2.4_linux_amd64.zip
  unzip goscan_2.4_linux_amd64.zip
  rm -rf goscan_2.4_linux_amd64.zip
  mv ./goscan /bin/goscan
  
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

  #phoninfoga
  curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
  mv ./phoneinfoga /usr/bin/phoneinfoga

  #photon
  git clone https://github.com/s0md3v/Photon.git

  #hopper
  wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
  dpkg -i Hopper-v4-4.7.1-Linux.deb
  rm -rf Hopper-v4-4.7.1-Linux.deb
    
  #subl
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
  
  
  #vscode
  sudo apt update
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt install -fy code
    
  #rphp
  git clone https://github.com/pentestmonkey/php-reverse-shell.git 
  mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
  rm -rf php-reverse-shell
    
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
  rm -rf /opt/rustscan_2.0.1_amd64.deb
    
  #bloodhound
  #defaul creds - neo4j:neo4j - need to change
  
  #SecLists
  git clone https://github.com/danielmiessler/SecLists.git

  #ghidra
  wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
  unzip ghidra_9.2.2_PUBLIC_20201229.zip
  rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
  mkdir ghidra
  mv ghidra_9.2.2_PUBLIC/* ghidra/
  rm -rf ghidra_9.2.2_PUBLIC/
  
  #evil limiter
  git clone https://github.com/bitbrute/evillimiter.git
  
  #nmap standalone
  wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap
  mv nmap /opt/server/
  
  #evil-winrm
  gem install evil-winrm
  
  #GitTools
  git clone https://github.com/internetwache/GitTools
  
  #impacket
  wget https://github.com/SecureAuthCorp/impacket/releases/download/impacket_0_9_23/impacket-0.9.23.tar.gz
  gunzip impacket-0.9.23.tar.gz
  tar -xvf impacket-0.9.23.tar
  rm -rf impacket-0.9.23.tar
  
  #RsaCtfTool
  git clone https://github.com/Ganapati/RsaCtfTool.git
fi
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#sudo apt-get install apt-transport-https
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo apt-get update
#sudo apt-get install sublime-text

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/

source /root/.bashrc

chmod -R 777 /opt/
reboot now
