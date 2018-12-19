########################### LINPEN ######################################################
# By Anakein										#
# Name: 	= LinuxPenetration (Linux Check Privilege Escalation)								#
# Reference 	= https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/	#
# Date		= 12/18/2018								#
# Usage 	= chmod +x linpen.sh && ./linpen.sh					#
#########################################################################################
while true
do
echo 	"  							        "
echo -e	"\e[96m#--------------------------------------------------------#"
echo -e "\e[96m#   LINPEN  < LINux Privelege Escalation PENtester >     #"
echo -e	"\e[96m#                                                        #"
echo -e "\e[96m#                      MENU                              #"
echo -e	"\e[96m#                                                        #"
echo -e	"\e[96m# Enter 1 to check Operating System                      #"
echo -e "\e[96m# Enter 2 to check Applications & Services               #"
echo -e "\e[96m# Enter 3 to check Communications & Networking           #"
echo -e "\e[96m# Enter 4 to check Confidential Information & Users      #"
echo -e "\e[96m# Enter 6 to check File Systems                          #"
echo -e "\e[96m# Enter 7 Preparation & Finding Exploit Code             #"
echo -e "\e[96m# Enter 8 to exit the menu                               #"
echo -e	"\e[96m# Enter your selection:  \c                              #"
read answer
case "$answer" in
    1)  echo " Operating System"
        echo 	"  							        "
        echo -e "\e[96m#                 Operating System                       #"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat's the distribution type? What version?          \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        cat /proc/version
        echo	"								"
        uname -a
        echo	"								"
        uname -mrs
        echo	"								"
        rpm -q kernel
        echo	"								"   
        dmesg | grep Linux
        echo	"								"
        ls /boot | grep vmlinuz-
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat can be learnt from the environmental variables? \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"                               "
        cat /etc/profile
        echo	"								"
        cat /etc/bashrc
        echo	"								"
        cat ~/.bash_profile
        echo	"								"
        cat ~/.bashrc
        echo	"								"
        cat ~/.bash_logout
        echo	"								"
        env
        echo	"								"
        set
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mIs there a printer?                                  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								" 
        lpstat -a 
        echo	"								"  ;;
    2)  echo -e	"\e[96m#---------------------------------------------------------------------------------------#"
        echo -e "\e[96m#                         Applications & Services                                       #"
        echo -e "\e[96m#   \e[93mWhat services are running? Which service has which user privilege?                  \e[96m#"
        echo -e	"\e[96m#---------------------------------------------------------------------------------------#"
        echo	"								"
        ps aux
        echo	"								"
        ps -ef
        echo	"								"
        #top
        echo	"								"
        cat /etc/services
        echo	"								"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhich service(s) are been running by root?                                 \e[96m#"
        echo -e "\e[96m#   \e[93mOf these services, which are vulnerable - it's worth a double check!       \e[96m#"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo	"								"
        ps aux | grep root
        echo	"								"
        ps -ef | grep root
        echo	"								"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat applications are installed?                                           \e[96m#"
        echo -e "\e[96m#   \e[93mWhat version are they?                                                     \e[96m#"
        echo -e "\e[96m#   \e[93mAre they currently running?                                                \e[96m#"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo	"								"
        ls -alh /usr/bin/
        echo	"								"
        ls -alh /sbin/
        echo	"								"
        dpkg -l
        echo	"								"
        rpm -qa
        echo	"								"
        ls -alh /var/cache/apt/archivesO
        echo	"								"
        ls -alh /var/cache/yum/
        echo	"								"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAny of the service(s) settings misconfigured?                              \e[96m#"
        echo -e "\e[96m#   \e[93mAre any (vulnerable) plugins attached?                                     \e[96m#"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo	"								"
        cat /etc/syslog.conf
        echo	"								"
        cat /etc/chttp.conf
        echo	"								"
        cat /etc/lighttpd.conf
        echo	"								"
        cat /etc/cups/cupsd.conf
        echo	"								"
        cat /etc/inetd.conf
        echo	"								"
        cat /etc/apache2/apache2.conf
        echo	"								"
        cat /etc/my.conf
        echo	"								"
        cat /etc/httpd/conf/httpd.conf
        echo	"								"
        cat /opt/lampp/etc/httpd.conf
        echo	"								"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat jobs are scheduled?                                                   \e[96m#"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo	"								"
        crontab -l
        echo	"								"
        ls -alh /var/spool/cron
        echo	"								"
        ls -al /etc/ | grep cron
        echo	"								"
        ls -al /etc/cron*
        echo	"								"
        cat /etc/cron*
        echo	"								"
        cat /etc/at.allow
        echo	"								"
        cat /etc/at.deny
        echo	"								"
        cat /etc/cron.allow
        echo	"								"
        cat /etc/cron.deny
        echo	"								"
        cat /etc/crontab
        echo	"								"
        cat /etc/anacrontab
        echo	"								"
        cat /var/spool/cron/crontabs/root
        echo	"								"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAny plain text usernames and/or passwords?                                 \e[96m#"
        echo -e	"\e[96m#------------------------------------------------------------------------------#"
        echo	"								"
        grep -i user [filename]
        echo	"								"
        grep -i pass [filename]
        echo	"								"
        grep -C 5 "password" [filename]
        echo	"								"
        find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"   # Joomla
        echo	"								" ;;
    3)  echo -e "\e[96m#                 Communications & Networking                       #"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat NIC(s) does the system have? Is it connected to another network?          \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        /sbin/ifconfig -a
        echo	"								"
        cat /etc/network/interfaces
        echo	"								"
        cat /etc/sysconfig/network
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat are the network configuration settings? \e[96m#"
        echo -e "\e[96m#   \e[93mWhat can you find out about this network?  \e[96m#"
        echo -e "\e[96m#   \e[93mDHCP server? DNS server? Gateway?          \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        cat /etc/resolv.conf
        echo	"								"
        cat /etc/sysconfig/network
        echo	"								"
        cat /etc/networks
        echo	"								"
        iptables -L
        echo	"								"
        hostname
        echo	"								"
        dnsdomainname
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat other users & hosts are communicating with the system?        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        lsof -i
        echo	"								"
        lsof -i :80
        echo	"								"
        grep 80 /etc/services
        echo	"								"
        netstat -antup
        echo	"								"
        netstat -antpx
        echo	"								"
        netstat -tulpn
        echo	"								"
        chkconfig --list
        echo	"								"
        chkconfig --list | grep 3:on
        echo	"								"
        last
        echo	"								"
        w
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhats cached? IP and/or MAC addresses        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"   
        echo	"								"
        arp -e
        echo	"								"
        route
        echo	"								"
        /sbin/route -nee
        echo	"								" ;;
	
    4)  echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo -e "\e[96m#                         Confidential Information & Users                              #"
        echo -e "\e[96m#   \e[93mWho are you? Who is logged in? Who has been logged in?                     \e[96m#"
        echo -e "\e[96m#   \e[93mWho else is there? Who can do what?                                        \e[96m#"
        echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo	"								" 
        echo	"								"
        id
        echo	"								"
        who
        echo	"								"
        w
        echo	"								"
        last
        echo	"								"
        cat /etc/passwd | cut -d: -f1    # List of users
        echo	"								"
        grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'   # List of s
        echo	"								"
        uper users
        echo	"								"
        awk -F: '($3 == "0") {print}' /etc/passwd   # List of super users
        echo	"								"
        cat /etc/sudoers
        echo	"								"
        sudo -l
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat sensitive files can be found?        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        cat /etc/passwd
        echo	"								"
        cat /etc/group
        echo	"								"
        cat /etc/shadow
        echo	"								"
        ls -alh /var/mail/
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAnything (interesting) in the home directorie(s)? If it's possible to access        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        ls -ahlR /root/
        echo	"								"
        ls -ahlR /home/
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAre there any passwords in; scripts, databases, configuration files or log files?  \e[96m#"
        echo -e "\e[96m#   \e[93mDefault paths and locations for passwords  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        cat /var/apache2/config.inc
        echo	"								"
        cat /var/lib/mysql/mysql/user.MYD
        echo	"								"
        cat /root/anaconda-ks.cfg
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat has the user being doing? Is there any password in plain text?  \e[96m#"
        echo -e "\e[96m#   \e[93mWhat have they been edting? \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        cat ~/.bash_history
        echo	"								"
        cat ~/.nano_history
        echo	"								"
        cat ~/.atftp_history
        echo	"								"
        cat ~/.mysql_history
        echo	"								"
        cat ~/.php_history
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat user information can be found?        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        cat ~/.bashrc
        echo	"								"
        cat ~/.profile
        echo	"								"
        cat /var/mail/root
        echo	"								"
        cat /var/spool/mail/root
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mCan private-key information be found?        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        cat ~/.ssh/authorized_keys
        echo	"								"
        cat ~/.ssh/identity.pub
        echo	"								"
        cat ~/.ssh/identity
        echo	"								"
        cat ~/.ssh/id_rsa.pub
        echo	"								"
        cat ~/.ssh/id_rsa
        echo	"								"
        cat ~/.ssh/id_dsa.pub
        echo	"								"
        cat ~/.ssh/id_dsa
        echo	"								"
        cat /etc/ssh/ssh_config
        echo	"								"
        cat /etc/ssh/sshd_config
        echo	"								"
        cat /etc/ssh/ssh_host_dsa_key.pub
        echo	"								"
        cat /etc/ssh/ssh_host_dsa_key
        echo	"								"
        cat /etc/ssh/ssh_host_rsa_key.pub
        echo	"								"
        cat /etc/ssh/ssh_host_rsa_key
        echo	"								"
        cat /etc/ssh/ssh_host_key.pub
        echo	"								"
        cat /etc/ssh/ssh_host_key
        echo	"								" ;;

    6)  echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo -e "\e[96m#                         File Systems                              #"
        echo -e "\e[96m#   \e[93mWhich configuration files can be written in /etc/? Able to reconfigure a service?  \e[96m#"
        echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo	"								"
        ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null     # Anyone
        echo	"								"
        ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null       # Owner
        echo	"								"
        ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null    # Group
        echo	"								"
        ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null        # Other
        echo	"								"
        echo	"								"
        find /etc/ -readable -type f 2>/dev/null               # Anyone
        echo	"								"
        find /etc/ -readable -type f -maxdepth 1 2>/dev/null   # Anyone
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat can be found in /var/ ?        \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        ls -alh /var/log
        echo	"								"
        ls -alh /var/mail
        echo	"								"
        ls -alh /var/spool
        echo	"								"
        ls -alh /var/spool/lpd
        echo	"								"
        ls -alh /var/lib/pgsql
        echo	"								"
        ls -alh /var/lib/mysql
        echo	"								"
        cat /var/lib/dhcp3/dhclient.leases
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAny settings/files (hidden) on website? Any settings file with database information?  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        ls -alhR /var/www/
        echo	"								"
        ls -alhR /srv/www/htdocs/
        echo	"								"
        ls -alhR /usr/local/www/apache22/data/
        echo	"								"
        ls -alhR /opt/lampp/htdocs/
        echo	"								"
        ls -alhR /var/www/html/
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mIs there anything in the log file(s) (Could help with (Local File Includes)!)  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        cat /etc/httpd/logs/access_log
        echo	"								"
        cat /etc/httpd/logs/access.log
        echo	"								"
        cat /etc/httpd/logs/error_log
        echo	"								"
        cat /etc/httpd/logs/error.log
        echo	"								"
        cat /var/log/apache2/access_log
        echo	"								"
        cat /var/log/apache2/access.log
        echo	"								"
        cat /var/log/apache2/error_log
        echo	"								"
        cat /var/log/apache2/error.log
        echo	"								"
        cat /var/log/apache/access_log
        echo	"								"
        cat /var/log/apache/access.log
        echo	"								"
        cat /var/log/auth.log
        echo	"								"
        cat /var/log/chttp.log
        echo	"								"
        cat /var/log/cups/error_log
        echo	"								"
        cat /var/log/dpkg.log
        echo	"								"
        cat /var/log/faillog
        echo	"								"
        cat /var/log/httpd/access_log
        echo	"								"
        cat /var/log/httpd/access.log
        echo	"								"
        cat /var/log/httpd/error_log
        echo	"								"
        cat /var/log/httpd/error.log
        echo	"								"
        cat /var/log/lastlog
        echo	"								"
        cat /var/log/lighttpd/access.log
        echo	"								"
        cat /var/log/lighttpd/error.log
        echo	"								"
        cat /var/log/lighttpd/lighttpd.access.log
        echo	"								"
        cat /var/log/lighttpd/lighttpd.error.log
        echo	"								"
        cat /var/log/messages
        echo	"								"
        cat /var/log/secure
        echo	"								"
        cat /var/log/syslog
        echo	"								"
        cat /var/log/wtmp
        echo	"								"
        cat /var/log/xferlog
        echo	"								"
        cat /var/log/yum.log
        echo	"								"
        cat /var/run/utmp
        echo	"								"
        cat /var/webmin/miniserv.log
        echo	"								"
        cat /var/www/logs/access_log
        echo	"								"
        cat /var/www/logs/access.log
        echo	"								"
        ls -alh /var/lib/dhcp3/
        echo	"								"
        ls -alh /var/log/postgresql/
        echo	"								"
        ls -alh /var/log/proftpd/
        echo	"								"
        ls -alh /var/log/samba/
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mHow are file-systems mounted?  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#" 
        echo	"								"
        mount
        echo	"								"
        df -h
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAre there any unmounted file-systems?  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        cat /etc/fstab
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhat (Advanced Linux File Permissions) are used? Sticky bits, SUID & GUID  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        find / -perm -1000 -type d 2>/dev/null   # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
        echo	"								"
        find / -perm -g=s -type f 2>/dev/null    # SGID (chmod 2000) - run as the group, not the user who started it.
        echo	"								"
        find / -perm -u=s -type f 2>/dev/null    # SUID (chmod 4000) - run as the owner, not the user who started it.
        echo	"								"
        find / -perm -g=s -o -perm -u=s -type f 2>/dev/null    # SGID or SUID
        echo	"								"
        for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null; done    # Looks in 'common' places: /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin and any other *bin, for SGID or SUID (Quicker search)
# find starting at root (/), SGID or SUID, not Symbolic links, only 3 folders deep, list with more detail and hide any errors (e.g. permission denied)
        echo	"								"
        find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mWhere can written to and executed from? A few 'common' places: /tmp, /var/tmp, /dev/shm \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        find / -writable -type d 2>/dev/null      # world-writeable folders
        echo	"								"
        find / -perm -222 -type d 2>/dev/null     # world-writeable folders
        echo	"								"
        find / -perm -o w -type d 2>/dev/null     # world-writeable folders
        echo	"								"
        find / -perm -o x -type d 2>/dev/null     # world-executable folders
        echo	"								"
        find / \( -perm -o w -perm -o x \) -type d 2>/dev/null   # world-writeable & executable folders
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mAny (problem) files? Word-writeable, (nobody) files  \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print   # world-writeable files
        echo	"								"
        find /dir -xdev \( -nouser -o -nogroup \) -print   # Noowner files
        echo	"								" ;;

    7)  echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo -e "\e[96m#                Preparation & Finding Exploit Code                              #"
        echo -e "\e[96m#   \e[93mWhat development tools/languages are installed/supported?    \e[96m#"
        echo -e	"\e[96m#-----------------------------------------------------------------#"
        echo	"								"
        find / -name perl*
        echo	"								"
        find / -name python*
        echo	"								"
        find / -name gcc*
        echo	"								"
        find / -name cc
        echo	"								"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo -e "\e[96m#   \e[93mHow can files be uploaded?                 \e[96m#"
        echo -e	"\e[96m#--------------------------------------------------------#"
        echo	"								"
        find / -name wget
        echo	"								"
        find / -name nc*
        echo	"								"
        find / -name netcat*
        echo	"								"
        find / -name tftp*
        echo	"								"
        find / -name ftp
        echo	"								";;

    8)  echo "Exit ....."
	exit ;;
    esac
done
