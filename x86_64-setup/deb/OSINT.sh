#Updated: November 1, 2021
#For use ONLY with Ubuntu 20.04
#These will assist with the creation of your custom machine and will be updated as things change
#Full usage details are available in the book: https://inteltechniques.com/book1.html
#Slight variations may be present for Windows/Mac users (such as 'Next' vs. 'Continue')
#Please send any issues to errors@inteltechniques.com
#Copyright 2021 Michael Bazzell
#These instructions are provided 'as is' without warranty of any kind
#In no event shall the copyright holder be liable for any claim, damages or other liability
#Full license information and restrictions at https://inteltechniques.com/osintbook8/license.txt#

#-------------------------------------------------------------------------------
#VM CREATION
#-------------------------------------------------------------------------------
#Install, configure, and launch VirtualBox
#Download Ubuntu 20.04 Desktop from https://releases.ubuntu.com/20.04/
#Within VirtualBox, click on the button labeled 'New'
#Provide a name of 'OSINT Original'
#Choose your desired location to save the machine on your host
#Select 'Linux' as the type, and 'Ubuntu 64-bit' as the version
#Click Continue
#In the Memory size window, move the slider to select 50% of your system memory
#Click Continue
#Click Create
#Leave the hard disk file type as VDI and click Continue
#Select the default option of 'Dynamically allocated' and click Continue
#Choose the desired size of your virtual hard drive (40GB+)
#Click Create
#Click the Settings icon
#Click the Storage icon
#Click the CD icon which displays 'Empty' in the left menu
#Click the small blue circle to the far right in the 'Optical Drive' option
#Select 'Choose a Disk File'
#Select the Ubuntu 20.04 ISO downloaded previously
#Click 'Open' or Choose' if prompted
#Click 'OK'
#If prompted, confirm the Ubuntu iso
#Click 'Start' in the main menu
#Click 'Start' again if prompted
#Select 'Install Ubuntu'
#Select your desired language and location, then click 'Continue'
#Select 'Normal Installation', 'Download Updates', and 'Install third party'
#Click 'Continue'
#Select 'Erase disk and install Ubuntu', then 'Install Now'. Confirm with 'Continue'
#Choose your desired time zone and click 'Continue'
#Choose a name, user name, computer name, and password of 'osint' for each
#Select 'Log in automatically' then 'Continue'
#Allow Ubuntu to complete the installation, and choose 'Restart Now'
#Click 'Enter' to reboot#

#-------------------------------------------------------------------------------
#VM CONFIGURATION
#-------------------------------------------------------------------------------
#Click 'Skip' then 'Next'
#Select 'No' and then 'Next' when asked to help improve Ubuntu
#Click 'Next' then 'Done' to remove the welcome screen
#If prompted to install updates, click 'Remind me later'
#In the VirtualBox Menu, select Devices > 'Insert Guest Additions CD Image'
#Click 'Run' when the dialogue box pops up, provide your password when prompted, then 'Authenticate'
#Once the process is complete, press enter, and power off the VM (Upper right menu)
#In VirtualBox, select your VM and click 'Settings'
#In the 'General' icon, click on the 'Advanced' tab
#Change 'Shared clipboard' and Drag n Drop' to 'Bidirectional'
#In the 'Display' icon, change the Video Memory to the maximum
#In the 'Shared Folders' icon, click the green '+'
#Click the dropdown menu under 'Folder Path'
#Select 'Other'
#Choose a desired folder on your host to share data and click 'Open'
#Select the 'Auto-mount' option and then 'OK'
#Click 'OK' to close the settings window
#Click on Start to restart your Ubuntu VM
#Resize the window if desired
#Resize the VM if desired (View > Virtual Screen > Scale)
#In the left dock, right-click and eject the CD
#Click the Applications Menu (9 dots) in the lower left and launch Settings
#Click 'Notifications' and disable both options
#Click the 'Privacy' option, then click 'Screen Lock' and disable all options
#Click 'File History & Trash', then disable the option
#Click 'Diagnostics', then change to 'Never'
#Click the back arrow and click Power, changing 'Blank Screen' to 'Never'
#Click 'Automatic Suspend' and disable the feature
#Close all Settings windows
#Click the Applications Menu and launch Software Updater
#Click 'Install Now' to apply all updates
#If prompted, restart the VM#

#-------------------------------------------------------------------------------
#DISPLAY MODIFICATION
#-------------------------------------------------------------------------------
#Some readers have reported the inability to resize VM windows within VirtualBox with the "Auto-resize Guest Display" greyed out. The following commands within Terminal of the Linux VM should repair. There is no harm running these if you are unsure.

sudo apt update
sudo apt install -y build-essential dkms gcc make perl
sudo rcvboxadd setup
reboot

#-------------------------------------------------------------------------------
#INSTALL OSINT TOOLS-BASIC
#-------------------------------------------------------------------------------
sudo adduser osint vboxsf
sudo apt purge -y apport
sudo apt remove -y popularity-contest
sudo snap install vlc
sudo apt update
sudo apt install -y ffmpeg
sudo apt install -y python3-pip
sudo -H python3 -m pip install youtube_dl
sudo -H python3 -m pip install yt-dlp
sudo -H python3 -m pip install youtube-tool
sudo -H python3 -m pip install xeuledoc
cd ~/Desktop
sudo apt install -y curl
curl -u osint8:book4529zw -O https://inteltechniques.com/osintbook8/vm-files.zip
unzip vm-files.zip -d ~/Desktop/
mkdir ~/Documents/scripts
mkdir ~/Documents/icons
cd ~/Desktop/vm-files/scripts
cp * ~/Documents/scripts
cd ~/Desktop/vm-files/icons
cp * ~/Documents/icons
cd ~/Desktop/vm-files/shortcuts
sudo cp * /usr/share/applications/
cd ~/Desktop
rm vm-files.zip
rm -rf vm-files
sudo -H python3 -m pip install streamlink
sudo -H python3 -m pip install Instalooter
sudo -H python3 -m pip install Instaloader
sudo snap install gallery-dl
sudo apt install -y git
mkdir /OSINT
cd /OSINT
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
sudo -H python3 -m pip install -r requirements.txt -I
sudo -H python3 -m pip install socialscan -I
sudo -H python3 -m pip install holehe -I
cd /OSINT
git clone https://github.com/WebBreacher/WhatsMyName.git
cd WhatsMyName
sudo -H python3 -m pip install -r requirements.txt -I
cd /OSINT
git clone https://github.com/ChrisTruncer/EyeWitness.git
cd EyeWitness/Python/setup
sudo -H ./setup.sh
sudo snap install amass
cd /OSINT
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo -H python3 -m pip install -r requirements.txt -I
cd /OSINT
git clone https://github.com/s0md3v/Photon.git
cd Photon && sudo -H python3 -m pip install -r requirements.txt -I
cd /OSINT
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
sudo -H python3 -m pip install -r requirements.txt -I
sudo -H python3 -m pip install pipenv -I
sudo -H python3 -m pip install webscreenshot -I
sudo add-apt-repository -y ppa:micahflee/ppa
sudo apt -y update
sudo apt install -y torbrowser-launcher
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb
sudo apt install -y mediainfo-gui
sudo apt install -y libimage-exiftool-perl
sudo apt install -y mat2
sudo apt install -y webhttrack
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
sudo apt install -y kazam
sudo snap install keepassxc
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install
sudo -H pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo -H python3 -m pip install -U
reboot

#-------------------------------------------------------------------------------
#INSTALL FIREFOX PROFILE
#-------------------------------------------------------------------------------
cd ~/Desktop
curl -u osint8:book4529zw -O https://inteltechniques.com/osintbook8/ff-template.zip
unzip ff-template.zip -d ~/.mozilla/firefox/
cd ~/.mozilla/firefox/ff-template/
cp -R * ~/.mozilla/firefox/*.default-release
cd ~/Desktop
rm ff-template.zip

#-------------------------------------------------------------------------------
#INSTALL SEARCH TOOLS
#-------------------------------------------------------------------------------
cd ~/Desktop
curl -u osint8:book4529zw -O https://inteltechniques.com/osintbook8/tools.zip
unzip tools.zip -d ~/Desktop/
rm tools.zip

#-------------------------------------------------------------------------------
#INSTALL OSINT TOOLS-ADVANCED
#-------------------------------------------------------------------------------
cd /OSINT
git clone https://github.com/opsdisk/metagoofil.git
cd metagoofil
sudo -H python3 -m pip install -r requirements.txt -I
cd /OSINT
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
sudo -H python3 -m pip install -r REQUIREMENTS -I
cd /OSINT
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
sudo -H python3 -m pip install -r requirements.txt -I
cd /OSINT
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo -H python3 -m pip install nested-lookup -I
sudo -H python3 -m pip install internetarchive -I
sudo apt install -y ripgrep
sudo -H python3 -m pip install bdfr -I
sudo -H python3 -m pip install redditsfinder -I
sudo -H python3 -m pip install waybackpy -I
sudo -H python3 -m pip install testresources -I

#-------------------------------------------------------------------------------
#SOFTWARE UPDATES
#-------------------------------------------------------------------------------
sudo apt update
sudo apt -y upgrade
sudo snap refresh
sudo apt update --fix-missing
sudo apt --fix-broken install
sudo -H pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo -H python3 -m pip install -U
cd /OSINT/EyeWitness
git pull https://github.com/ChrisTruncer/EyeWitness.git
cd /OSINT/Sublist3r
git pull https://github.com/aboul3la/Sublist3r.git
cd /OSINT/Photon
git pull https://github.com/s0md3v/Photon.git
cd /OSINT/theHarvester
git pull https://github.com/laramies/theHarvester.git
cd /OSINT/sherlock
git pull https://github.com/sherlock-project/sherlock.git
cd /OSINT/WhatsMyName
git pull https://github.com/WebBreacher/WhatsMyName.git
cd /OSINT/metagoofil
git pull https://github.com/opsdisk/metagoofil.git
cd /OSINT/sherloq
git pull https://github.com/GuidoBartoli/sherloq.git
cd /OSINT/recon-ng
git pull https://github.com/lanmaster53/recon-ng.git
cd /OSINT/spiderfoot
git pull https://github.com/smicallef/spiderfoot.git
cd /OSINT/Elasticsearch-Crawler
git pull https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo apt autoremove -y
