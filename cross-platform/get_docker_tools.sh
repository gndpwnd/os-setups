#!/bin/bash
tools=(
"byt3bl33d3r/crackmapexec"
"calebjstewart/pwncat"
"projectdiscovery/nuclei"
"empireproject/empire"
"oscarakaelvis/evil-winrm"
"belane/bloodhound"
)

tool_aliases=(
"docker run -it --entrypoint=/bin/sh --name crackmapexec -v ~/.cme:/root/.cme byt3bl33d3r/crackmapexec"
"docker run -v \"./\":/work -t pwncat 10.0.0.1 4444"
"docker run projectdiscovery/nuclei"
"docker run empireproject/empire"
"export scripts_dir='/opt/server/ps_scripts/'; export exe_dir='/opt/server/exe/'; docker run --rm -ti --name evil-winrm -v ${scripts_dir}:/ps1_scripts -v ${exe_dir}:/exe_files -v ${pwd}:/data oscarakaelvis/evil-winrm"
"docker run -it -p 7474:7474 -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/dri:/dev/dri -v $(pwd)/data:/data --name bloodhound belane/bloodhound"
)

i=0

for tool in "${tools[@]}"; do
	docker pull $tool
	toolname=$(echo ${tool} | cut -f2 -d "/")
	echo -e "alias ${toolname}=\"${tool_aliases[${i}]}\"" >> ~/.bash_aliases
	i=$(($i+1))
done
clear
echo "Done!!!"
