#!/bin/bash

# ----- Init -----

NS1=1.1.1.1
NS2=1.0.0.1

echo "nameserver $NS1" > /etc/resolv.conf
echo "nameserver $NS2" >> /etc/resolv.conf

echo "generate locales en_US.UTF-8"
locale-gen en_US.UTF-8

apt update


# ----- Downloaded Tools -----

dpkg -i /opt/obsidian_0.12.15_amd64.deb
dpkg -i /opt/ao_6.9.0_amd64.deb
dpkg -i /opt/vlc_3.0.12-0+deb10u1_amd64.deb
dpkg -i /opt/discord-0.0.16.deb


set -e

# ----- Common tools -----

echo "Install some common tools for further installation"

apt-get install -y vim wget net-tools locales bzip2 python3 python3-pip \
    gcc g++ gzip p7zip p7zip-full build-essential libelf-dev \
    linux-headers-`uname -r` bc dkms apt-transport-https terminator \
    thunderbird libreoffice libgconf-2-4 libappindicator1 libc++1 git docker \
    iperf3 xwallpaper sudo git docker curl wget

apt --fix-broken install



# ----- XFCE -----

echo "Install Xfce4 UI components"
apt-get install -y supervisor xfce4 xfce4-terminal xterm



# ----- Chrome -----

apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
ln -s /usr/bin/chromium-browser /usr/bin/google-chrome
### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init



# ----- Fonts -----

echo "Installing ttf-wqy-zenhei"
apt-get install -y ttf-wqy-zenhei




# ----- Libnss_wrapper -----

echo "Install nss-wrapper to be able to execute image as non-root user"
apt-get install -y libnss-wrapper gettext

echo "add 'source generate_container_user' to .bashrc"

# have to be added to hold all env vars correctly
echo 'source $STARTUPDIR/generate_container_user' >> $HOME/.bashrc

# ----- TigerVNC -----
apt install -fy tigervnc-standalone-server