# Apps

pacman -S sudo terminator tmux discord spotifyd thunderbird libreoffice-fresh libreoffice-sdk audacity go git docker python ruby rust openssh clusterssh xclip vim 

# User Acc
useradd -m -G wheel -s /bin/bash lab
passwd lab
echo “lab ALL= (ALL)ALL” >> /etc/sudoers

# yay

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R debugpoint:users ./yay
id debugpoint
cd yay
makepkg -si
cd /opt

# snap
cd /opt
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -s
sudo pacman -U snapd-2.30-9-x86_64.pkg.tar.xz
sudo systemctl enable snapd

# snap packages
sudo snap install spotify
