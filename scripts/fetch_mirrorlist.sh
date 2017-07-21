MIRROR_URL="https://www.archlinux.org/mirrorlist/?country=DE&country=GB&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"

# Execute a command as root (or sudo)
do_with_root() {
    # already root? "Just do it" (tm).
    if [[ `whoami` = 'root' ]]; then
        $*
    elif command -v sudo > /dev/null; then
        echo "sudo $*"
        sudo $*
    else
        echo "Please run this script as root."
        exit 1
    fi
}

#check for curl
if ! command -v curl > /dev/null; then
    echo "curl needs to be installed!"; exit 1
fi

curl -s $MIRROR_URL | sed 's/#//' > /tmp/mirrorlist
if [ $? != 0 ]; then exit 1; fi
#override last backup
do_with_root mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.BAK
if [ $? != 0 ]; then exit 1; fi
do_with_root mv /tmp/mirrorlist /etc/pacman.d/mirrorlist
if [ $? != 0 ]; then exit 1; fi
echo new mirrorlist written to /etc/pacman.d/mirrorlist
