##############################
#         COLORS
##############################

export NC='\e[0m' # No Color
export BLACK='\e[0;30m'
export GRAY='\e[1;30m'
export RED='\e[0;31m'
export LIGHT_RED='\e[1;31m'
export GREEN='\e[0;32m'
export LIGHT_GREEN='\e[1;32m'
export BROWN='\e[0;33m'
export YELLOW='\e[1;33m'
export BLUE='\e[0;34m'
export LIGHT_BLUE='\e[1;34m'
export PURPLE='\e[0;35m'
export LIGHT_PURPLE='\e[1;35m'
export CYAN='\e[0;36m'
export LIGHT_CYAN='\e[1;36m'
export LIGHT_GRAY='\e[0;37m'
export WHITE='\e[1;37m'

##############################
#         OPTIONS
##############################

export TERM=xterm-color
unset GREP_OPTIONS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##############################
#         ENV
##############################

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH=$PATH:~/.platformio/penv/bin
export DOTNET_ROOT=/opt/dotnet
export gitpriv="${USER}/.ssh/gitpriv"

##############################
#         Functions
##############################

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

get_git() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    repo=$(basename `git rev-parse --show-toplevel`)
    branch=$(git branch | grep \* | cut -f2 -d" " 2> /dev/null)
    commit=$(git rev-list HEAD --count)
    if [[ `git status --porcelain` ]]; then
      mod="m"
    else
      mod=""
    fi
    if [[ `git stash list | grep stash` == No* ]]; then
      stash=""
    elif [[ `git stash list | grep stash` == fatal* ]]; then
      stash=""
    elif [[ `git stash list | grep stash` == stash* ]]; then
      stash="s"
    fi
    echo "${GREEN}[${repo}:${branch}:${commit}] ${YELLOW}[${mod}${stash}]"
  fi
}

##############################
#           Prompt
##############################

[[ $- != *i* ]] && return 

PS1="${BLUE}\u${PURPLE}@${RED}\h ${CYAN}[\w] $(get_git)\n${WHITE}\$→ ${LIGHT_GRAY}"

##############################
#           ALIASES
##############################

alias ls='ls --color=auto'
alias l='ls -la'
alias lr='ls -la -R'
alias rf='rm -rf'
alias py='python3'
alias d='rm -rf'
alias up='python3 -m http.server 8000'
alias psa='ps aux | grep'
alias sc='SSH_AUTH_SOCK='
alias esf='ssh-agent -s; ssh-add'
alias root='sudo su'

alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'
alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'

alias r='FILE=$1; rustc $FILE && bash $FILE | rev | cut -c4- | rev'

alias gc='git clone'
alias gd='git diff'
alias gs='git status'
alias gb='git checkout'
alias gbn='git checkout -b'
alias gbd='git branch -d'
alias gm='git merge'
alias gp='git add -A && git commit -m'
alias gr='git reset --soft HEAD^'
alias yeet='git push --set-upstream origin'
alias yoink='git pull'

alias di="docker images"
alias dc="docker container ls"
alias dcp="docker container prune"
alias dv="docker volume ls"
alias dvp="docker volume prune"
alias dp='docker pull'

alias jn='jupyter notebook &'
alias jl='jupyter lab &'
alias dotnet='/opt/dotnet/dotnet'
alias msbuild='/opt/dotnet/dotnet msbuild'
alias cultparrot='curl parrot.live'

alias screenres='bash /opt/screenres.sh'
alias mc='macchanger'

alias autorecon='python3 /opt/AutoRecon/autorecon.py'
alias photon='python3 /opt/Photon/photon.py'
alias dirsearch='python3 /opt/dirsearch/dirsearch.py'
alias dnschef='python3 /opt/dnschef/dnschef.py'
alias GetUserSPNs='python3 /opt/impacket/examples/GetUserSPNs.py'
alias getTGT='python3 /opt/impacket/examples/getTGT.py'
alias smbserver='python3 /opt/impacket/examples/smbserver.py'
alias secretsdump='python3 /opt/impacket/examples/secretsdump.py'
alias psexec='python3 /opt/impacket/examples/psexec.py'
alias mssqlclient='python3 /opt/impacket/examples/mssqlclient.py'

alias ghidra='bash /opt/ghidra/ghidraRun'