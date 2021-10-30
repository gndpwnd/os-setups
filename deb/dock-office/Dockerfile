FROM ubuntu:20.04

### User Setup
ENV ROOTPASS=toor
ENV USERNAME=lab
ENV USERPASS=toor
ENV VNCPASSWD=toortoor
ENV VNCRES=1280x1500

### VNC Setup
ENV DISPLAY=:1 \
    VNC_PORT=5566 \
    NO_VNC_PORT=6969 \
    SSH_PORT=22
EXPOSE $VNC_PORT $NO_VNC_PORT $SSH_PORT
ENV PYTHONUNBUFFERED TRUE


### Envrionment config
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/init \
    INST_SCRIPTS=/opt/os-install-src \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=$VNCRES \
    VNC_PW=$VNCPASSWD \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Networking

RUN echo "nameserver 1.1.1.1" > /etc/resolv.conf
RUN echo "nameserver 1.0.0.1" >> /etc/resolv.conf

### Office Tool Setup

RUN apt update && apt install -fy wget

ADD os-install-src /opt/os-install-src

RUN $INST_SCRIPTS/install/install_custom_fonts.sh

RUN apt install -y tigervnc-standalone-server
RUN $INST_SCRIPTS/no_vnc.sh

RUN $INST_SCRIPTS/firefox.sh
RUN $INST_SCRIPTS/install/chrome.sh

### Setup Fs

RUN chmod -R 777 /opt/
RUN rm -rf /opt/*.deb /opt/*.xz /opt/*.tar

RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +
RUN find $INST_SCRIPTS/install -name '*.sh' -exec chmod a+x {} +

RUN $INST_SCRIPTS/install/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get -y update && apt-get -y install python3 python3-pip gcc g++ gzip p7zip p7zip-full build-essential libelf-dev linux-headers-`uname -r` bc dkms apt-transport-https terminator thunderbird libreoffice libgconf-2-4 libappindicator1 libc++1 git docker iperf3 xwallpaper sudo git docker curl wget

CMD ["/opt/install-tools.sh"]

RUN apt --fix-broken install


### Desktop ui 
RUN $INST_SCRIPTS/install/xfce_ui.sh
ADD os-install-src/xfce/ $HOME/


RUN $INST_SCRIPTS/install/libnss_wrapper.sh
ADD os-install-src/scripts $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

#RUN echo 'root:$ROOTPASS' | chpasswd
#RUN useradd -m -u 2001 $USERNAME
#RUN echo '$USERNAME:$USERPASS' | chpasswd
COPY dotfiles/* $HOME/
COPY wlps/* ${HOME}/Pictures/wallpapers/

### Customize UI
#RUN xwallpaper --zoom ${HOME}/Pictures/wallpapers/3d-dark.jpg


ENTRYPOINT ["/init/vnc_startup.sh"]
CMD ["--wait"]