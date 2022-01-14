##################################################
#                   PG Lang
##################################################
go_version="1.17.6"

# Rust

wget https://sh.rustup.rs -O rustup.sh && bash rustup.sh -y && rm -rf rustup.sh
PATH="$HOME/.cargo/bin:$PATH"

# Nodejs

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo echo "deb-src https://deb.nodesource.com/node_14.x focal main" > /etc/apt/sources.list
sudo apt -y install nodejs gcc g++ make
PATH="$HOME/.local/bin:$PATH"

node  -v

# Yarn

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -fy yarn
yarn -V

# Platformio (C/C++ Framework)

wget https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -O get-platformio.py
python3 get-platformio.py
rm -rf get-platformio.py

#pypi

pip3 isntall numpy scipy matplotlib pandas nose tk \
             argparse imutils tqdm rich \
             jupyter jupyterlab \
             opencv-python


#jupyter extensions

jupyter labextension install jupyterlab-plotly

# golang

wget -c https://dl.google.com/go/go${go_version}.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
PATH="/usr/local/go/bin:$PATH"
