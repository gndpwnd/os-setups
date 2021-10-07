
#!/bin/bash

subl readme.txt
cp /opt/pwnnotes/pen_pwnnotes_template.ctb* .
subl readme.txt
subl /opt/pwnnotes/report-template-1.0.txt
subl /opt/pwnnotes/revshells.txt
subl /opt/pwnnotes/revshellls2.0.txt
subl /opt/pwnnotes/koth-specific/metwis-lin.txt
subl /opt/pwnnotes/koth-specific/metwis-win.txt
mkdir pwnnotes
mkdir recon
mkdir enum
mkdir exploitation
cp /opt/pwnnotes/pen_pwnnotes_template.ctb* .
mv pen_pwnnotes_template.ctb pwnnotes/pwnnotes.ctb
mv pen_pwnnotes_template.ctb~ pwnnotes/pwnnotes.ctb~
mv pen_pwnnotes_template.ctb~~ pwnnotes/pwnnotes.ctb~~
mv pen_pwnnotes_template.ctb~~~ pwnnotes/pwnnotes.ctb~~~
cherrytree pwnnotes/pwnnotes.ctb
