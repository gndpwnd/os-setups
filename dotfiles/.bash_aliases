##########   SYS   ##########

alias l='ls -la'
alias lr='ls -la -R'
alias rf='rm -rf'
alias py='python3'
alias d='rm -rf'
alias firefox='/usr/lib/firefox/firefox'
alias up='python3 -m http.server 8000'
alias psa='ps aux | grep'
alias sc='SSH_AUTH_SOCK='
alias esf='ssh-agent -s; ssh-add'
alias root='sudo su'

##########   VPN   ##########

alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'
alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'
#OFFSECVPN

##########   Compilers   ##########

alias r='FILE=$1; rustc $FILE && bash $FILE | rev | cut -c4- | rev'

##########   GIT   ##########
#getting into switching from:
#using 'gp' to prep, then use 'yeet {branchname}' to push

alias gc='git clone'

# switch branch
alias gb='git checkout'
# make a new branch
alias gbn='git checkout -b'
# delete a branch
alias gbd='git branch -d'
# merge a branch
alias gm='git merge'

alias gs='git status'
alias gp='git add -A && git commit -m "update"'
alias yeet='git push --set-upstream origin'
alias yoink='git pull'

##########   DOCKER   ##########

alias di="docker images"
alias dc="docker container ls"
alias dcp="docker container prune"
alias dv="docker volume ls"
alias dvp="docker volume prune"
alias dp='docker pull'

##########   STARTUP APPS   ##########

#alias obsidian='cd /opt/ && ./Obsidian-0.12.19.AppImage &'
#alias vncv='cd /opt/ && ./VNC-Viewer-6.21.920-Linux-x64 &'
#alias firefox=' /usr/lib/firefox/firefox &'

##########   MISC TOOLS   ##########

alias dirsearch='python3 /opt/dirsearch/dirsearch.py'
alias ghidra='bash /opt/ghidra/ghidraRun'
alias photon='python3 /opt/Photon/photon.py'
alias bloodhound='bash /opt/bloodhound/Bloodhound'
alias screenres='bash /opt/screenres.sh'
alias room='bash /opt/pwnnotes/pwnnotes_start.sh'
alias mc='macchanger'

##########   DEV00PS   ##########
alias jn='jupyter notebook &'
alias jl='jupyter lab &'
alias cultparrot='curl parrot.live'
### PY ###
# pip install rich
alias rich='python -m rich'

