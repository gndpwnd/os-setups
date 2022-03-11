#!/bin/bash

outdir=$1

if [ -n $outdir ]; then

	scripts=(
	"EmpireProject/Empire/master/data/module_source/situational_awareness/host/Invoke-WinEnum"
	"EmpireProject/Empire/master/data/module_source/credentials/Invoke-PowerDump"
	"EmpireProject/Empire/master/data/module_source/credentials/Invoke-TokenManipulation"
	"EmpireProject/Empire/master/data/module_source/credentials/Invoke-DCSync"
	"EmpireProject/Empire/master/data/module_source/credentials/Invoke-Mimikatz."
	"EmpireProject/Empire/master/data/module_source/credentials/Invoke-Kerberoast"
	"Kevin-Robertson/Tater/master/Tater"
	"rasta-mouse/Sherlock/master/Sherlock"
	"PowerShellEmpire/PowerTools/master/PowerView/powerview"
	"PowerShellEmpire/PowerTools/master/PowerUp/PowerUp"
	"itm4n/PrivescCheck/master/PrivescCheck"
	"411Hall/JAWS/master/jaws-enum"
	"Arvanaghi/SessionGopher/master/SessionGopher"
	"samratashok/nishang/master/Shells/Invoke-PowerShellTcp"
	"besimorhino/powercat/master/powercat"
	"mmessano/PowerShell/master/dns-dump"
	"hausec/ADAPE-Script/master/ADAPE"
	)

	for script in "${scripts[@]}"; do
		wget https://raw.githubusercontent.com/${script}.ps1 
	done
	mkdir $outdir
	mv *.ps1 $outdir
	clear
	echo "Done!!!"
else
echo "Need to specify Outdir..."
fi
