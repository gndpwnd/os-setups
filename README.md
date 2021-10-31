# OS Setups
> Scripts and Containers for deploying custom virtual environments


### Script Overview


### VMware

1. Create, Install, and run a VM. 
2. Execute the setup scripts in respect to the OS, and the VM use case.
3. See the following commands for reference:

Ubuntu:
            /opt/path/to/setup.sh
Arch:
            /opt/path/to/setup.sh

### Docker

See the following Commands to setup docker containers:

1. **Run without persistant storage drive**

Non-Interactive

    docker run -d -it -p 5901:5901 -p 6969:6969 {image_name} bash
            
Interactive (Ctrl+p & Ctrl+q to exit interactive mode)

    docker run -it -p 5901:5901 -p 6969:6969 {image_name} bash


2. **Run with Persistent storage drive**

**Ubuntu**
            docker run 
            
4. Interact
   **Visit the Following Urls to connect to the container's VNC**
