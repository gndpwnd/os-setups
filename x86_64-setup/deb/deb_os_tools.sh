#!/bin/bash

##################################################
#             	Check Root
##################################################
if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi

##################################################
#             Specify Software Versions
##################################################

libappindicator_version="3-1_0.4.92-7"
libindicator_version="3-7_0.5.0-2"
hopper_version="4-4.7.1"
rustscan_verion="2.0.1/"
ghidra_down_version="9.2.2_PUBLIC_20201229"
ghidra_version="9.2.2_PUBLIC"
kerbrute_version="1.0.3"
obsidian_version="0.12.15"


libfdk_aac_version="0.1.6-1"
obsidian_version="0.12.15"
VNC_Viewer_version="6.21.1109"
go_version="1.14.2"

##################################################
#          Make a new ssh key
##################################################
clear
echo "Generating a new ssh key..."
KEY_NAME="gitpriv"
read -p "Enter email for new ssh key: " EMAIL
ssh-keygen -t ed25519 -C $EMAIL << EOF 
${HOME}/.ssh/${KEY_NAME}


EOF
ssh-add ${HOME}/.ssh/${KEY_NAME}
clear

##################################################
#          Collect Some Information
##################################################
echo "default no..."
read -p 'Need repo? y/n>  ' repo
echo "default no..."
read -p 'Need to prep file sys? y/n> ' fisys
echo "default yes..."
clear
##################################################
#          Make Some File System Changes
##################################################
if [ $fisys == "y" ]
then
   chmod -R 777 /opt
  cp -r pwnnotes/ /opt
  chmod -R 777 /opt/pwnnotes
  bash /opt/pwnnotes/setup.sh
  echo 'moving to /opt'
  mkdir /opt/server
   mkdir /ctf
   mkdir /thm
   mkdir /htb
   chmod 777 /opt/server
   chmod 777 /ctf
   chmod 777 /htb
   chmod 777 /thm
  
  #networking
   echo "nameserver 1.1.1.1" > /etc/resolv.conf
   echo "nameserver 1.0.0.1" >> /etc/resolv.conf
else
 echo "No changes to your file sys"
fi

##################################################
#          Add The Kali Repo
##################################################
if [ $repo == "y" ]
then
  echo 'adding apt repo'
  #repo
  #echo "" > /etc/apt/sources.list
  wget -q -O - archive.kali.org/archive-key.asc | apt-key add
  echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
  apt-get update
else 
  echo "No changes to your repositories"
fi

##################################################
#          Install Tools
##################################################

echo "OK, Installing Tools"
  
####################################################################################################
#                                                APT
####################################################################################################
#libindicator
wget http://ftp.de.debian.org/debian/pool/main/libi/libindicator/libindicator${libindicator_version}_amd64.deb
apt install ./libindicator${libindicator_version}_amd64.deb
rm -rf libindicator${libindicator_version}_amd64.deb

#libappindicator
wget http://ftp.de.debian.org/debian/pool/main/liba/libappindicator/libappindicator${libappindicator_version}_amd64.deb
apt install ./libappindicator${libappindicator_version}_amd64.deb
rm -rf libappindicator${libappindicator_version}_amd64.deb

 apt update --fix-missing
 apt --fix-broken install

 apt install -fy sqlitebrowser golang nasm default-jdk terminator git docker.io \
                       cherrytree wireshark python3 python3-pip sqlitebrowser golang terminator openvpn gnome-tweaks \
                       audacity exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh audacity bloodhound \
                       tor torbrowser-launcher nmap masscan exploitdb armitage set dsniff nikto osrframework recon-ng \
                       netdiscover legion voiphopper zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 \
                       reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps burpsuite \
                       dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife \
                       powersploit backdoor-factory veil-evasion bettercap beef-xss rtpflood \
                       crunch hash-identifier john johnny rainbowcrack hashcat arduino crowbar hydra \
		       powershell-empire starkiller \
                       adb bison gawk bc ccache device-tree-compiler dex2jar android-sdk \
		       git docker.io iperf3 speedtest-cli vlc

# Misc Docker setup
systemctl start docker
systemctl enable docker
groupadd docker
usermod -aG docker $USER
systemctl restart docker
 
apt update --fix-missing
apt --fix-broken install
####################################################################################################
#                                              PIP
####################################################################################################
python3 -m pip install --upgrade

pip3 install bloodhound pyinstaller pynput==1.6.8
####################################################################################################
#                                              SNAP
####################################################################################################
apt install -y snapd
systemctl start snapd
systemctl enable snapd
snap install code --classic
snap install sublime-text --classic
snap install simplescreenrecorder
####################################################################################################
#						GIT Clone
####################################################################################################
git_tools = (
lgandx/Responder
iphelix/dnschef
trustedsec/unicorn
jopohl/urh
carlospolop/privilege-escalation-awesome-scripts-suite
EmpireProject/Empire
icsharpcode/ILSpy
JohnHammond/poor-mans-pentest
maurosoria/dirsearch
s0md3v/Photon
pentestmonkey/php-reverse-shell
bitbrute/evillimiter
internetwache/GitTools
Ganapati/RsaCtfTool
D35m0nd142/LFISuite
kurobeats/fimap
calebstewart/pwncat
dwisiswant0/apkleaks
0dayCTF/reverse-shell-generator
byt3bl33d3r/pth-toolkit
hakluke/hakrawler
danielmiessler/SecLists
SecureAuthCorp/impacket
)

for repo in $gits;
do
	git clone https://github.com/${repo}.git
done

#linpeas setup
mkdir peas
mv privilege-escalation-awesome-scripts-suite/* peas/
rm -rf privilege-escalation-awesome-scripts-suite/
cp peas/linPEAS/linpeas.sh /opt/server/
cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

#poor mans pentest setup
mkdir pmp
mv poor-mans-pentest/* pmp/
rm -rf poor-mans-pentest


####################################################################################################
#                                          CURL / WGET
####################################################################################################
#phoninfoga
curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
mv ./phoneinfoga /usr/bin/phoneinfoga

#hopper
wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v${hopper_version}-Linux.deb
dpkg -i Hopper-v${hopper_version}-Linux.deb
rm -rf Hopper-v${hopper_version}-Linux.deb

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
wget https://github.com/RustScan/RustScan/releases/download/${rustscan_verion}/rustscan_${rustscan_verion}_amd64.deb
dpkg -i rustscan_${rustscan_verion}_amd64.deb
rm -rf rustscan_${rustscan_verion}_amd64.deb

#bloodhound
#defaul creds - neo4j:neo4j - need to change

#ghidra
wget https://ghidra-sre.org/ghidra_${ghidra_version}.zip
unzip ghidra_${ghidra_down_version}.zip
rm -rf ghidra_${ghidra_down_version}.zip
mkdir ghidra
mv ghidra_${ghidra_version}/* ghidra/
rm -rf ghidra_${ghidra_version}/

#nmap standalone
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap
mv nmap /opt/server/

####################################################################################################
#                                                 OTHER
####################################################################################################
#evil-winrm
gem install evil-winrm

#obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.15/obsidian_${obsidian_version}_amd64.deb
apt install ./obsidian_${obsidian_version}_amd64.deb
rm -rf obsidian_${obsidian_version}_amd64.deb

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make &&  make install
reboot now
