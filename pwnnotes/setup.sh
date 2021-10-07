#!/bin/bash


#setup custom aliases

read -p "Username 4 this box: " uboi

#user aliases
echo "alias up='python3 -m http.server 8000'" > /home/$uboi/.bash_aliases
echo "alias room='bash /opt/pwnnotes/pwnnotes_start.sh'" >> /home/$uboi/.bash_aliases
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> /home/$uboi/.bash_aliases
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> /home/$uboi/.bashrc
echo "alias photon='python3 /opt/Photon/photon.py'" >> /home/$uboi/.bashrc
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> /home/$uboi/.bash_aliases
echo "alias screenres='bash /opt/screenres.sh'" >> /home/$uboi/.bash_aliases
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> /home/$uboi/.bash_aliases
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> /home/$uboi/.bash_aliases
echo "alias ga='git add * && git commit -am 'changes' && git push'" >> /home/$uboi/.bash_aliases
echo "alias gs='echo git remote set-url origin git@github.com:Username/Project.git'" >> /home/$uboi/.bash_aliases
# "git add . && git commit -am 'changes' && git push"

source /home/$uboi/.bash_aliases

#root aliases
echo "alias up='python3 -m http.server 8000'" > /root/.bash_aliases
echo "alias room='bash /opt/pwnnotes/pwnnotes_start.sh'" >> /root/.bash_aliases
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> /root/.bash_aliases
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> /root/.bash_aliases
echo "alias photon='python3 /opt/Photon/photon.py'" >> /root/.bash_aliases
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> /root/.bash_aliases
echo "alias screenres='bash /opt/screenres.sh'" >> /root/.bash_aliases
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> /root/.bash_aliases
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> /root/.bash_aliases
echo "alias gs='echo git remote set-url origin git@github.com:Username/Project.git'" >> /root/.bash_aliases
echo "alias ga='git add * && git commit -am 'changes' && git push'" >> /root/.bash_aliases
# "git add . && git commit -am 'changes' && git push"
source /root/.bash_aliases

echo DONE!
