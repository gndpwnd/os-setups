#!/bin/bash
report_template="pen_report_template.ctb"
notes="pen_notes.ctb"
report="report.ctb"
read -p "Full Path to /pwnnotes > " pwnnotes_dir
read -p "Name of challenge/box/room > " pen_name
mkdir $pen_name
mkdir ${pen_name}/pwnnotes
mkdir ${pen_name}/recon
mkdir ${pen_name}/enum
mkdir ${pen_name}/exploitation

cp ${pwnnotes_dir}/reporting/$report_template ${pen_name}/pwnnotes/$report
chmod -R 777 ${pen_name}
cherrytree ${pen_name}/pwnnotes/$report &
