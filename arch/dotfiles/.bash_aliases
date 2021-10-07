alias firefox='/usr/lib/firefox/firefox'
alias up='python3 -m http.server 8000'
alias room='bash /opt/pwnnotes/pwnnotes_start.sh'
alias dirsearch='python3 /opt/dirsearch/dirsearch.py'
alias ghidra='bash /opt/ghidra/ghidraRun'
alias photon='python3 /opt/Photon/photon.py'
alias bloodhound='cd bash /opt/bloodhound/Bloodhound'
alias screenres='bash /opt/screenres.sh'
alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'
alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'

alias lab='cat /OffSec/pwk-oscp-official/lab-conn/note.txt && echo "" && sudo openvpn /OffSec/pwk-oscp-official/lab-conn/OS-548490-PWK.ovpn'
gg ()
{
        git add -A && git commit -m "changes" && git push
}
gc ()
{
        git clone $1
}

alias dp='curl parrot.live'
