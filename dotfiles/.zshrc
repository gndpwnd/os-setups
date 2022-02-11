##############################
#        GRADIENT MATH
##############################

num_of_char_in_user=3
num_of_char_in_host=6

half=2
half_user=$((num_of_char_in_user / half ))
half_host=$((num_of_char_in_host / half ))

if [ "$half_host" == *".5" ]; then
  $h1=$half_host + 1
  $h2=$half_host
  start_host=${HOSTNAME:0:$h1}  
  end_host=${HOSTNAME: -h2}
else
  start_host=${HOSTNAME:0:half_host}  
  end_host=${HOSTNAME: -half_host}
fi

if [ "$half_user" == "*.5" ]; then
  $u1=$half_user
  $u2=$half_user + 1
  start_user=${USER:0:u1}  
  end_user=${USER: -u2}
else
  start_user=${USER:0:half_user}  
  end_user=${USER: -half_user}
fi

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
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##############################
#         Functions
##############################

get_git() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git_repo=$(basename `git rev-parse --show-toplevel`)
    git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    echo "git ${git_repo}:${git_branch}"
  fi
}

##############################
#            PS1
##############################

[[ $- != *i* ]] && return	

#gradient="${BLUE}${start_user}${PURPLE}${end_user}@${start_host}${RED}${end_host}"
#dir=" ${CYAN}\w\n${GREEN}$(get_git) \[${WHITE}$→ ${LIGHT_GRAY}"
#PS1="${gradient}${dir}"

PS1="${BLUE}\u${PURPLE}@${RED}\h ${CYAN}\w\n${GREEN}$(get_git) \[${WHITE}$→ ${LIGHT_GRAY}"

##############################
#         KEYBINDINGS
##############################
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[C' forward-word                       # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[D' backward-word                      # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab undo last action

##############################
#          HISTORY
##############################
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it


##############################
#           ALIASES
##############################

##########   SYS   ##########
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias l='ls -la'
alias ls='ls --color=auto'
alias lr='ls -la -R'
alias rf='rm -rf'
alias py='python3'
alias d='rm -rf'
alias firefox='/usr/lib/firefox/firefox &'
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

alias gc='git clone'
alias gd='git diff'
alias gs='git status'
alias gb='git checkout'
alias gbn='git checkout -b'
alias gbd='git branch -d'
alias gm='git merge'
alias gp='git add -A && git commit -m'
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
alias screenres='bash /opt/screenres.sh'
alias room='bash /opt/pwnnotes/pwnnotes_start.sh'
alias mc='macchanger'

##########   DEV00PS   ##########
alias jn='jupyter notebook &'
alias jl='jupyter lab &'
alias cultparrot='curl parrot.live'

##############################
#          ENV
##############################

source ~/.bash_aliases
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/go/bin:$PATH"


if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=$PATH:~/.platformio/penv/bin
export gitpriv="${USER}/.ssh/gitpriv"
