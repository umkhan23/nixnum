# nixnum
Nixnum is a simple Linux enumeration script I wrote to assist in CTF challenges.  

Note: This is still a work in progress and all feedback/pull requests are welcome. I'd love to improve this script and make it better!

### Getting Started
```bash
git clone https://github.com/umkhan23/nixnum.git
cd nixnum
chmod +x nixnum.sh
```

### Usage
```
Usage: ./nixnum.sh [options]

Pick any flag below to begin enumeration:
                     
-Q | Quick scan      Help: Performs a quick scan.
-F | Full scan       Help: Performs a complete scan.

```

### Features
Nixnum tells you:
* Running Processes
* Processes running as root
* Hostname
* Kernel version
* Environment variables
* Users and superusers
* Open ports
* SUID bit set
* Cronjobs
* Config files
* File/folder Permissions
* Bash history
* Nano history

