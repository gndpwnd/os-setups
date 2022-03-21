#!/bin/bash
mkdir /opt/server
cd /opt/

if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi

#make a new priveliged ssh key
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
#             Specify Software Versions
##################################################

blender_version="2.79"
libfdk_aac_version="0.1.6-1"
obsidian_version="0.12.15"
VNC_Viewer_version="6.21.1109"
go_version="1.17.6"

##################################################
#                   Networking
##################################################

echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf


##################################################
#                APT Repo Packages
##################################################

apt update && apt upgrade -y
apt install -fy vim snap gparted build-essential libelf-dev linux-headers-`uname -r` bc dkms \ 
                     apt-transport-https xclip terminator thunderbird libreoffice chromium-browser firefox \
                     libgconf-2-4 libappindicator1 libc++1 adb \
                     git docker.io iperf3 speedtest-cli \
                     ffmpeg curl wget \

apt --fix-broken install

##################################################
#                APT Standalone Packages
##################################################

wget http://ftp.osuosl.org/pub/ubuntu/pool/multiverse/f/fdk-aac/libfdk-aac${libfdk_aac_version}_amd64.deb
apt install -y ./libfdk-aac${libfdk_aac_version}_amd64.deb

wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${obsidian_version}/obsidian_${obsidian_version}_amd64.deb
sudo apt install -y ./obsidian_${obsidian_version}_amd64.deb

wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${VNC_Viewer_version}-Linux-x64.deb
sudo apt install ./VNC-Viewer-${VNC_Viewer_version}-Linux-x64.deb

apt --fix-broken install

rm -rf libfdk-aac${libfdk_aac_version}_amd64.deb
rm -rf obsidian_${obsidian_version}_amd64.deb
rm -rf VNC-Viewer-${VNC_Viewer_version}-Linux-x64.deb

##################################################
#               Snap Packages
##################################################

snap install ao spotify vlc discord cherrytree cura-slicer rpi-imager
snap install blender --channel=${blender_version}/stable --classic
snap install sublime-text --classic
snap install code --classic

##################################################
#            PPA Repos and Packages
##################################################
apt install -fy apt-transport-https ca-certificates curl gnupg
curl -fsSL https://gvisor.dev/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/gvisor-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gvisor-archive-keyring.gpg] https://storage.googleapis.com/gvisor/releases release main" | sudo tee /etc/apt/sources.list.d/gvisor.list > /dev/null
sudo apt-get update && sudo apt-get install -y runsc

add-apt-repository ppa:maarten-baert/simplescreenrecorder
apt-get update
apt-get install simplescreenrecorder

add-apt-repository ppa:obsproject/obs-studio
apt update
apt install obs-studio

apt --fix-broken install


##################################################
#          Alfa USB WiFi Adapter Drivers
##################################################

#wireless drivers
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/

chmod -R 777 /opt/
