
#!/bin/bash
printf "#!/bin/bash

function Ubuntu()
{
     apt-get update -y
     apt-get upgrade -y
     apt-get install nano -y
     apt-get install gnome-core firefox flashplugin-installer -y
     apt-get install vnc4server -y
     vncserver
     vncserver -kill :1
     cd ~
     wget https://ginernet.com/downloads/vnc-ubuntu-12.txt -O .vnc/xstartup
     mkdir -p /etc/vncserver
     echo 'VNCSERVERS=\"1:root\"' >> /etc/vncserver/vncservers.conf
     echo 'VNCSERVERARGS[1]=\"-geometry 1000x700\"' >> /etc/vncserver/vncservers.conf
     cd /etc/init.d/; wget https://ginernet.com/downloads/vnc-init-ubuntu-12.txt -O vncserver
     chmod 755 vncserver
     update-rc.d vncserver defaults 99
     reboot
}

function Debian()
{
     apt-get update -y
     apt-get upgrade -y
     apt-get install nano -y
     apt-get install gnome-core flashplugin-nonfree -y
     apt-get install vnc4server -y
     vncserver
     vncserver -kill :1
     cd ~; wget https://ginernet.com/downloads/vnc-debian-7.txt -O .vnc/xstartup
     mkdir -p /etc/vncserver
     echo 'VNCSERVERS=\"1:root\"' >> /etc/vncserver/vncservers.conf
     echo 'VNCSERVERARGS[1]=\"-geometry 1000x700\"' >> /etc/vncserver/vncservers.conf
     cd /etc/init.d/
     wget https://ginernet.com/downloads/vnc-init-ubuntu-12.txt -O vncserver
     chmod 755 vncserver
     update-rc.d vncserver defaults 99
     reboot
}

function CentOS()
{
   yum install nano -y
   yum update -y
   yum upgrade -y
   yum install tigervnc-server -y
   yum groupinstall \"Desktop\" -y
   yum install firefox -y
   rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
   rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
   yum install flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl -y
   echo 'echo \"nameserver 8.8.8.8\" >> /etc/resolv.conf; ' >> /etc/rc.local
   echo 'VNCSERVERS=\"1:root\"' >> /etc/sysconfig/vncservers
   echo 'VNCSERVERARGS[1]=\"-geometry 1000x700\"' >> /etc/sysconfig/vncservers
   vncpasswd
   chkconfig vncserver on --level 345
   reboot
} 
\"\n\"
"  >> zz.sh

lsb_release -i -s >> zz.sh

chmod 777 zz.sh

rm OneClickScript.sh

./zz.sh

