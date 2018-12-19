########################### LINPEN ######################################################
# By Anakein										#
# Name: 	= Linux Enumpen								#
# Reference 	= https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/	#
# Date		= 12/18/2018								#
# Usage 	= chmod +x linpen.sh && ./linpen.sh					#
#########################################################################################
echo 	"  							        "
echo -e	"\e[96m#--------------------------------------------------------#"
echo -e "\e[96m#   LINPEN  < LINux Privelege Escalation PENtester >     #"
echo -e	"\e[96m#--------------------------------------------------------#"
echo	"								"
echo -e "\e[39m"
uname -a
echo 	"								"
cat /etc/issue
echo	"								"
cat /etc/*release
echo 	"  							        "
echo -e	"\e[96m#--------------------------------------------------------#"
echo -e "\e[96m#                 Operating System                       #"
echo -e "\e[96m#   \e[93mWhat's the distribution type? What version?          \e[96m#"
echo -e	"\e[96m#--------------------------------------------------------#"
echo	"								"
cat /etc/issue
echo	"								"
cat /etc/*-release
echo	"								"
cat /etc/lsb-release      # Debian based
echo	"								"
cat /etc/redhat-release   # Redhat based
echo	"								"
echo -e	"\e[96m#--------------------------------------------------------#"
echo -e "\e[96m#   \e[93mWhat's the kernel version? Is it 64-bit?             \e[96m#"
echo -e	"\e[96m#--------------------------------------------------------#"
echo	"								"
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
echo	"								"
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
echo	"								"
echo -e	"\e[96m#---------------------------------------------------------------------------------------#"
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
echo	"								"
echo -e	"\e[96m#---------------------------------------------------------------------------------------#"
echo -e "\e[96m#                         Communications & Networking                                   #"
echo -e	"\e[96m#---------------------------------------------------------------------------------------#"
