alias la='ls -la'
alias py='python3'
alias d='rm -rf'
alias firefox='/usr/lib/firefox/firefox'
alias up='python3 -m http.server 8000'
alias room='bash /opt/pwnnotes/pwnnotes_start.sh'
alias dirsearch='python3 /opt/dirsearch/dirsearch.py'
alias ghidra='bash /opt/ghidra/ghidraRun'
alias photon='python3 /opt/Photon/photon.py'
alias bloodhound='cd bash /opt/bloodhound/Bloodhound'
alias screenres='bash /opt/screenres.sh'
alias mc='macchanger'
alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'
alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'
alias r='FILE=$1; rustc $FILE && bash $FILE | rev | cut -c4- | rev'
alias gb='git checkout'
alias gbs='git push --set-upstream origin nn-beta'
alias gc='git clone $1'
alias gg='git add -A && git commit -m "update" && git push' 
alias gp='git push'
alias di="docker images"
alias dc="docker container ls"
alias dcp="docker container prune"
alias dv="docker volume ls"
alias dvp="docker volume prune"
alias esf="ssh-agent -s; ssh-add "
alias dp='curl parrot.live'
alias vncv='cd /opt/ && ./VNC-Viewer-6.21.920-Linux-x64 &'
alias psa='ps aux | grep'
