FROM ubuntu:20.04

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#  ----------------- DNS ----------------- 

ENV NS1=1.1.1.1 \
    NS2=1.0.0.1

# ----------------- Main Firewall -----------------

ENV FTP1_PORT=20 \
    FTP2_PORT=21 \
    SSH_PORT=22 \
    HTTP_PORT=80 \
    SMB_PORT=139

EXPOSE $FTP1_PORT $FTP2_PORT $SSH_PORT $HTTP_PORT $SMB_PORT

#  ----------------- Creds ----------------- 

ENV ROOTPASS=toor \
    USERNAME=lab \
    USERPASS=toor \
    VNCPASSWD=toortoor \

# ----------------- VNC Setup ----------------- 

ENV DISPLAY=:1 \
    VNC_PORT=5566 \
    NO_VNC_PORT=6969 \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1500 \
    VNC_PW=$VNCPASSWD \
    VNC_VIEW_ONLY=false

EXPOSE $VNC_PORT $NO_VNC_PORT
ENV PYTHONUNBUFFERED TRUE


#  ----------------- Envrionment config ----------------- 

ENV HOME=/home/$USERNAME\
    TERM=xterm \
    STARTUPDIR=/init \
    INST_SCRIPTS=/opt/scripts
WORKDIR $HOME


# ----------------- Adduser ----------------- 

RUN echo 'root:$ROOTPASS' | chpasswd
RUN echo -e "${USERPASS}\n${USERPASS}\n\n\n\n\n\nY\n"
RUN echo '$USERNAME:$USERPASS' | chpasswd

COPY dotfiles/ $HOME/
COPY wlps/* ${HOME}/Pictures/wallpapers/


# ----------------- Install -----------------

ADD scripts $INST_SCRIPTS
RUN chmod -R 777 /opt/

RUN $INST_SCRIPTS/firefox.sh
RUN $INST_SCRIPTS/install-tools.sh
RUN $INST_SCRIPTS/no_vnc.sh

RUN rm -rf /opt/*.deb /opt/*.xz /opt/*.tar

#  ----------------- Post Install ----------------- 

RUN $INST_SCRIPTS/chrome-init.sh

# ----------------- Dotfiles ----------------- 

RUN $INST_SCRIPTS/install/xfce_ui.sh
COPY dotfiles/ $HOME/

COPY scripts/post/ $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME
RUN xwallpaper --zoom ${HOME}/Pictures/wallpapers/3d-dark.jpg

ENTRYPOINT ["/init/vnc_startup.sh"]
CMD ["--wait"]
