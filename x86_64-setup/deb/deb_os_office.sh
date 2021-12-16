#!/bin/bash
mkdir /opt/server
cd /opt/

if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi

##################################################
#                   Networking
##################################################

echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

##################################################
#                   PG Lang
##################################################

# Rust

curl https://sh.rustup.rs -sSf | sh
export $PATH="$HOME/.cargo/bin:$PATH"

# Nodejs

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo echo "deb-src https://deb.nodesource.com/node_14.x focal main" > /etc/apt/sources.list
sudo apt -y install nodejs gcc g++ make
node  -v

# Yarn

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn -V

# Platformio (C/C++ Framework)

wget https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -O get-platformio.py
python3 get-platformio.py
rm -rf get-platformio.py


##################################################
#                APT Repo Packages
##################################################

apt update && apt upgrade -y
apt install -fy vim snap gparted build-essential libelf-dev linux-headers-`uname -r` bc dkms \ 
                     apt-transport-https xclip terminator thunderbird libreoffice chromium-browser firefox \
                     libgconf-2-4 libappindicator1 libc++1 adb \
                     git docker.io iperf3 speedtest-cli golang \
                     ffmpeg curl wget \

apt --fix-broken install

##################################################
#                APT Standalone Packages
##################################################

wget http://ftp.osuosl.org/pub/ubuntu/pool/multiverse/f/fdk-aac/libfdk-aac1_0.1.6-1_amd64.deb
dpkg -i libfdk-aac1_0.1.6-1_amd64.deb
rm -rf libfdk-aac1_0.1.6-1_amd64.deb
apt --fix-broken install

##################################################
#               Snap Packages
##################################################

snap install ao spotify vlc discord cherrytree cura-slicer rpi-imager
snap install blender --channel=2.79/stable --classic
snap install sublime-text --classic
snap install code --classic

##################################################
#            PPA Repos and Packages
##################################################

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

##################################################
#                 PGLang Setup
##################################################

#pypi

pip3 isntall numpy scipy matplotlib pandas nose tk \
             argparse imutils tqdm \
             jupyter jupyterlab  opencv-python


#jupyter extensions

jupyter labextension install jupyterlab-plotly

##################################################
#       Open Links To Get Latest Packages
##################################################

#Download
x-www-browser https://www.realvnc.com/en/connect/download/viewer/
x-www-browser https://obsidian.md/download

chmod -R 777 /opt/
