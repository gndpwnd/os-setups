#!/bin/bash

# ----- Init -----

NS1=1.1.1.1
NS2=1.0.0.1

echo "nameserver $NS1" > /etc/resolv.conf
echo "nameserver $NS2" >> /etc/resolv.conf

#echo "generate locales en_US.UTF-8"
#locale-gen en_US.UTF-8

apt update && apt upgrade -y


set -e

# ----- Common tools -----

echo "Install some common tools for further installation"
apt --fix-broken install -y

apt-get install -fy vim wget net-tools locales firefox bzip2 python3 python3-pip \
    gcc g++ gzip p7zip p7zip-full build-essential libelf-dev \
    linux-headers-`uname -r` bc dkms apt-transport-https terminator \
    thunderbird libreoffice libgconf-2-4 libappindicator1 libc++1 git docker \
    iperf3 xwallpaper sudo git docker curl wget novnc vlc \
    gconf2 gconf-service libnotify4 libappindicator1 libxtst6 libnss3 libxss1 \
    libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0 \
    xubuntu-desktop
apt --fix-broken install -y

# ----- XFCE -----

echo "Install Xfce4 UI components"
apt-get install -fy supervisor xfce4 xfce4-terminal xterm
apt --fix-broken install -y


# ----- Chrome -----

apt-get install -fy chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
apt --fix-broken install
ln -s /usr/bin/chromium-browser /usr/bin/google-chrome
### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init
apt --fix-broken install -y


# ----- Fonts -----

echo "Installing ttf-wqy-zenhei"
apt-get install -fy ttf-wqy-zenhei
apt --fix-broken install -y



# ----- Libnss_wrapper -----

echo "Install nss-wrapper to be able to execute image as non-root user"
apt-get install -fy libnss-wrapper gettext
apt --fix-broken install -y

echo "add 'source generate_container_user' to .bashrc"

# have to be added to hold all env vars correctly
echo 'source $STARTUPDIR/generate_container_user' >> $HOME/.bashrc


# ----- TigerVNC -----

apt install -fy tigervnc-standalone-server
apt --fix-broken install -y