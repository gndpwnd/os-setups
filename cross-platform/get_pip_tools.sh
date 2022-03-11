#!/bin/bash

pip_tools=(
"bloodhound"
"pipx"
)
pipx_tools=(
"Tib3rius/AutoRecon"
)

for tool in "${pip_tools[@]}"; do
	pip3 install ${tool}
done
source ~/.bashrc
for tool in "${pipx_tools[@]}"; do
        pipx install git+https://github.com/${tool}.git
done
