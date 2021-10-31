#!/bin/bash

apt update && apt upgrade -y

apt install -fy gconf2 gconf-service libnotify4 libappindicator1 libxtst6 libnss3 libxss1 \
    libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0

dpkg -i /opt/downloads/obsidian_0.12.15_amd64.deb
dpkg -i /opt/downloads/ao_6.9.0_amd64.deb
dpkg -i /opt/downloads/discord-0.0.16.deb
apt --fix-broken install -y
