#!/bin/bash

#banner

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
sleep 1

#info
printf -- '\033[96m [*] Nixnum Local Linux Enumeration Script                 [*] \033[0m\n'
printf -- '\033[96m [*] Version : 1.0                                         [*] \033[0m\n'
printf -- '\033[96m [*] Author : Usman Q Khan                                 [*] \033[0m\n'
printf -- '\033[96m [*] Project Home : https://www.github.com/umkhan23/nixnum [*] \033[0m\n'
printf -- '\033[96m [*] Follow me on Twitter : @UsmanQaiserKhan               [*] \033[0m\n'
printf -- '\n'
printf -- '\n'
sleep 1

#processes
printf -- '\033[91m Checking for running processes..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
ps aux
printf -- '\n'

#hostname
printf -- '\033[91m Checking hostname..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
hostname
printf -- '\n'

#root processes
printf -- '\033[91m Checking for processes running as root..... \033[0m\n'
printf -- '\033[34m ##################################          \033[0m\n'
sleep 1
ps aux | grep root
printf -- '\n'

#kernel info
printf -- '\033[91m Checking for kernel version.....    \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
uname -a
printf -- '\n'

#env variables
printf -- '\033[91m Checking environment variables..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
printenv
printf -- '\n'

#users
printf -- '\033[91m Checking for users..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat /etc/passwd | cut -d: -f1
printf -- '\n'

#superusers
printf -- '\033[91m Checking for superusers..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
grep -v -E “^#” /etc/passwd | awk -F: ‘$3 == 0 { print $1}’
printf -- '\n'

#open ports
printf -- '\033[91m Checking for open ports..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
netstat -antup
printf -- '\n'

#SUID
printf -- '\033[91m Checking for SUID bit set..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find / -perm -u=s -type f 2>/dev/null
printf -- '\n'

#cron
printf -- '\033[91m Checking for cronjobs..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
ls -la /etc/cron.d
sleep 1
crontab -l
printf -- '\n'

#config
printf -- '\033[91m Checking for config files..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find /etc/ -readable -type f 2>/dev/null
printf -- '\n'

#permissions
printf -- '\033[91m Checking for world-writable folders..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
find / -perm -o w -type d 2>/dev/null
printf -- '\n'

#bash history
printf -- '\033[91m Checking bash history..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat ~/.bash_history
printf -- '\n'

#nano history
printf -- '\033[91m Checking nano history..... \033[0m\n'
printf -- '\033[34m ##################################  \033[0m\n'
sleep 1
cat ~/.nano_history
printf -- '\n'

#end
printf -- '\033[32m [*] SUCCESS: ALL CHECKS COMPLETED :) [*]    \033[0m\n';
