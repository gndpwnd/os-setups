#!/bin/bash
apt update

if [ "$full1" == 'n' ]
then
  if [ "$remdek" == "n" ]
  then 
    echo "ok skipping the installation of remote desktop programs"
  else
    echo "installing remote desktop programs"
    #xrdp
    apt install -fy x2goserver 
  fi
  
  if [ "$webh" == "n" ]
  then
    echo "ok skipping web hosting tools"
  else
    echo "installing web hosting tools"
     sudo apt install -fy openvpn tor torsocks
     
  
  if [ "$cloud" == "n" ]
  then
    echo "ok skipping the installation of could programs"
  else
    # zerotier
    apt install -fy bash-completion x2goserver
    # run 'taskel' to change desktop gui EX: xfce --> gnome
    wget https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbnBDemtmb0lCbVl2aXE0dzgxWDhQVmxXRVVVZ3xBQ3Jtc0trMEtTNG1ZdldCcmRLQkRoT3B0RE5nYXJyME5uV2ZtT0VtZ3QwUGw3ZWRESlVrREVNYjA2Q0dvQU93MU1zRXM3OENQTmNxb2lYYmlHN3hoa200bnV0LWNCbmxEb1ZHdjBCZUJ5LWRJV3hNaHQ3Zmttdw&q=https%3A%2F%2Fdownload.zerotier.com%2Fdebian%2Fbuster%2Fpool%2Fmain%2Fz%2Fzerotier-one%2Fzerotier-one_1.4.6_armhf.deb
    dpkg -i zerotier-one_1.4.6_armhf.deb
    update-rc.d zerotier-one enable
  fi
  
else 
  echo "confirmed: installing all gray tools..."
  apt install xrdp openvpn tor torsocks
fi
