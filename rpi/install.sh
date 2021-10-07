#!/bin/bash

# make sure required files are in their locations
cd /opt

prog="[+]"
noprog="[-]"

file1=/opt/clusterchunk/pi_pen_node/install.sh
file2=/opt/clusterchunk/pi_pen_node/gray_tools.sh
file3=/opt/clusterchunk/pi_pen_node/red-blue_tools.sh

if [test -f "$file1"]; then
  echo $prog
else
  echo $noprog" file missing: "$file1
  echo "make sure all files are in clusterchunk folder, and move the clusterchunk folder to you /opt directory"
  return
  if [test -f "$file2"]; then
    echo $prog
  else
    echo $noprog" file missing: "$file2
    echo "make sure all files are in clusterchunk folder, and move the clusterchunk folder to you /opt directory"
    return
    if [test -f "$file3"]; then
      echo $prog" all required files exist in their respective directories"
    else
      echo $noprog" file missing: "$file2
      echo "make sure all files are in clusterchunk folder, and move the clusterchunk folder to you /opt directory"
      return
    fi
  fi
fi
#####################################################



echo "remember: default answer to all questions is a yes :)"

echo "info for gray tool installation:"
read -p 'Full install of gray tools? y/n> ' full1

echo  "info for red and blue tool installation:"
read -p 'Full install of red and blue tools? y/n> ' full2


if [ "$full1" == "n" ]
then 
  echo "ok,  choose the GRAY tools you want to install"
  read -p 'Remote desktop programs?> ' remdek
  read -p 'Cloud connectivity programs?> ' cloud
  read -p 'Web hosting, mainly tor?> ' webh
  exec /opt/clusterchunk/pi_pen_node/gray_tools.sh
else
  echo "ok, installing all GRAY tools..."
  exec /opt/clusterchunk/pi_pen_node/gray_tools.sh
fi
  
  
if  [ "$full2" == "n" ]
then 
  echo "ok,  choose the RED and BLUE tools you want to install..."
  read -p 'Networking?> ' net
  read -p 'Recon?> ' recon
  read -p 'Enumeration?> ' enum
  read -p 'Reverse Engineering and Forensics?> ' revfor
  read -p 'Exploitation?> ' xploit
  read -p 'Post exploitation?> ' post
  exec /opt/clusterchunk/pi_pen_node/red-blue_tools.sh
else
  echo "ok, installing all RED and BLUE tools..."
  exec /opt/clusterchunk/pi_pen_node/red-blue_tools.sh
fi

chmod -R 777 /opt/
sudo reboot now
