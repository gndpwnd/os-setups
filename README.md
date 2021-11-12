# OS Setups
> This Branch is for setting up docker containers rather than full VMs

#### SPEED IS KEY
Im looking for a way to rapidly deploy pre-configured environments so that I can resume any work from a template.


### Docker

See the following Commands to setup docker containers:

1. **Run without persistant storage drive**

Non-Interactive

    docker run -d --name {name} -it -p 5901:5901 -p 6969:6969 {image_name} bash
            
Interactive (Ctrl+p & Ctrl+q to exit interactive mode)

    docker run --name {name} -it -p 5901:5901 -p 6969:6969 {image_name} bash


2. **Run with Persistent storage drive**

**Ubuntu**
            docker run 
            
4. Interact
   **Visit the Following Urls to connect to the container's VNC**

### VNC
Working to figure out using vnc to connect to the container. This adds support for GUI-based apps.

