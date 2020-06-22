#!/bin/bash

start=$SECONDS

#banner
banner () {
printf -- '\033[31m         )            )                      \033[0m\n';
printf -- '\033[93m        ( /(        ( /(                     \033[0m\n';
printf -- '\033[93m        )\()) (    ) )\())    ()    )        \033[0m\n';
printf -- '\033[33m       ((_)\  )\  ( /(((_)\   ))   ()        \033[0m\n';
printf -- '\033[33m      _((_)((_) )\())_((_) /((_)   )\        \033[0m\n';
printf -- '\033[91m     | \| | (_)((_)\| \| |(_))(  _((_))      \033[0m\n';
printf -- '\033[91m     |    | | |\ \ /|    || || ||    \|      \033[0m\n';
printf -- '\033[31m     |_|\_| |_|/_\_\|_|\_| \_,_||_|_|_|      \033[0m\n';
printf -- '\033[34m ##########################################  \033[0m\n';
printf -- '\n'
printf -- '\n'
}

#info
info () {
printf -- '\033[96m [*] Nixnum Local Linux Enumeration Script                 [*] \033[0m\n'
printf -- '\033[96m [*] Version : 1.0                                         [*] \033[0m\n'
printf -- '\033[96m [*] Author : Usman Q Khan                                 [*] \033[0m\n'
printf -- '\033[96m [*] Project Home : https://www.github.com/umkhan23/nixnum [*] \033[0m\n'
printf -- '\033[96m [*] Follow me on Twitter : @UsmanQaiserKhan               [*] \033[0m\n'
printf -- '\n'
}

#processes
run_proc () {
printf -- '\033[91m Checking for running processes..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
ps aux
printf -- '\n'
}

#networking
network () {
printf -- '\033[91m Checking networking info..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
ifconfig -a
printf -- '\n'
}

#iptables
firewall () {
printf -- '\033[91m Checking for ip tables..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
iptables -L
printf -- '\n'
}

#root processes
root_proc () {
printf -- '\033[91m Checking for processes running as root..... \033[0m\n'
printf -- '\033[34m ##################################          \033[0m\n'
sleep 1
ps aux | grep root
printf -- '\n'
}

#services
services () {
printf -- '\033[91m Checking for services on the machine..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat /etc/services
printf -- '\n'
}

#kernel info
kernel_enum () {
printf -- '\033[91m Checking for kernel version.....    \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
uname -a
printf -- '\n'
}

#env variables
env_var () {
printf -- '\033[91m Checking environment variables..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
printenv
printf -- '\n'
}

#users
users () {
printf -- '\033[91m Checking for users..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat /etc/passwd | cut -d: -f1
printf -- '\n'
}

#superusers
superusers () {
printf -- '\033[91m Checking for superusers..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
grep '^sudo:.*$' /etc/group | cut -d: -f4
printf -- '\n'
}

#open ports
open_ports () {
printf -- '\033[91m Checking for open ports..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
netstat -antup
printf -- '\n'
}

#SUID
suid () {
printf -- '\033[91m Checking for SUID..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find / -perm -u=s -type f 2>/dev/null
printf -- '\n'
}

#GUID
guid () {
printf -- '\033[91m Checking for GUID.....              \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find / -perm -g=s -type f 2>/dev/null
printf -- '\n'
}

#cron
cronjobs () {
printf -- '\033[91m Checking for cronjobs..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
ls -la /etc/cron.d
sleep 1
crontab -l
printf -- '\n'
}

#permissions
writable_dirs () {
printf -- '\033[91m Checking for world-writable folders..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find / -perm -o w -type d 2>/dev/null
printf -- '\n'
}

#modified files
mod_files () {
printf -- '\033[91m Checking for recently modified files in /etc..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find /etc -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort -r
printf -- '\n'
}

mod_home () {
printf -- '\033[91m Checking for recently modified files in /home..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find /home -type f -mmin -60
printf -- '\n'
}

#ssh
ssh_check () {
printf -- '\033[91m Checking if root can login via SSH..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat /etc/ssh/sshd_config | grep PermitRootLogin
printf -- '\n'
}

#bash history
bash_history () {
printf -- '\033[91m Checking bash history..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat ~/.bash_history
printf -- '\n'
}

#nano history
nano_history () {
printf -- '\033[91m Checking nano history..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat ~/.nano_history
printf -- '\n'
}

#end
end () {
printf -- '\033[32m [*]    SUCCESS: ALL CHECKS COMPLETED    [*]    \033[0m\n';
end=$SECONDS

echo -e "\033[96m [*] Enumeration completed in $((end-start)) seconds. [*]    \033[0m\n"
}


if [ $# == 0 ]; then
	banner
	info
	cat <<EOF

Usage: $0 [options]

Pick any flag below to begin enumeration:
                     
-Q | Quick scan      Help: Performs a quick scan.
-F | Full scan       Help: Performs a complete scan.
EOF

elif [ $1 == -Q ]; then
	banner
	info
	network
	kernel_enum
	users
	superusers
	open_ports
	end	
elif [ $1 == -F ]; then
	banner
	info
	run_proc
	network
	firewall
	root_proc 
	services
	kernel_enum
	env_var
	users
	superusers
	open_ports
	suid
	guid
	cronjobs
	writable_dirs
	mod_files
	mod_home
	ssh_check
	bash_history
	nano_history
	end
elif [ $# -gt 1 ]; then
	printf -- '\033[91m Error: Invalid Flag \033[0m\n';
else
	printf -- '\033[91m Error: Invalid Flag \033[0m\n';
fi

