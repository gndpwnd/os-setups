FROM ubuntu:20.04

#  ----------------- DNS ----------------- 

ENV NS1=1.1.1.1
ENV NS2=1.0.0.1

# ----------------- Main Firewall -----------------

ENV FTP1_PORT=20
ENV FTP2_PORT=21
ENV SSH_PORT=22
ENV HTTP_PORT=80
ENV SMB_PORT=139

EXPOSE $FTP1_PORT $FTP2_PORT $SSH_PORT $HTTP_PORT $SMB_PORT

#  ----------------- Creds ----------------- 

ENV ROOTPASS=toor
ENV USERNAME=lab
ENV USERPASS=toor
ENV USERHOME=/home/$USERNAME
ENV VNCPASSWD=toortoor

# ----------------- VNC Setup ----------------- 

ENV DISPLAY=:1
ENV VNC_PORT=5566
ENV NO_VNC_PORT=6969
ENV NO_VNC_HOME=/headless/noVNC
ENV DEBIAN_FRONTEND=noninteractive
ENV VNC_COL_DEPTH=24
ENV VNC_RESOLUTION=1280x1500
ENV VNC_PW=$VNCPASSWD
ENV VNC_VIEW_ONLY=false

EXPOSE $VNC_PORT $NO_VNC_PORT
ENV PYTHONUNBUFFERED TRUE


#  ----------------- Envrionment config ----------------- 

ENV HOME=/home/$USERNAME
ENV TERM=xterm
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=/opt/scripts


# ----------------- Install -----------------

COPY downloads /opt/downloads
COPY scripts /opt/scripts

RUN chmod -R 777 /opt/

#RUN ${INST_SCRIPTS}/firefox.sh
#RUN ${INST_SCRIPTS}/no_vnc.sh
#RUN ${INST_SCRIPTS}/init-install.sh
#RUN ${INST_SCRIPTS}/install-tools.sh

#RUN rm -rf /opt/*.deb /opt/*.xz /opt/*.tar


# ----------------- Adduser ----------------- 

RUN useradd -ms /bin/bash $USERNAME

COPY dotfiles $USERHOME/
COPY wlps $USERHOME/Pictures/wallpapers

RUN echo 'root:$ROOTPASS' | chpasswd
#RUN echo 'USERNAME:$USERPASS' | chpasswd
#RUN echo -e "${USERPASS}\n${USERPASS}\n\n\n\n\n\nY\n" | adduser $USERNAME

#  ----------------- Post Install ----------------- 
RUN mkdir /init

RUN mkdir $STARTUPDIR

#RUN ${INST_SCRIPTS}/post/chrome-init.sh
RUN chmod -R 777 $STARTUPDIR &&  chmod -R 777 $USERHOME

COPY scripts/post/ $STARTUPDIR

#RUN xwallpaper --zoom $USERHOME/Pictures/wallpapers/3d-dark.jpg

USER $USERNAME

#ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
#CMD ["--wait"]