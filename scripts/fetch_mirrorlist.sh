wget "https://www.archlinux.org/mirrorlist/?country=DE&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on" -O - | sed 's/#//' > mirrorlist && sudo mv mirrorlist /etc/pacman.d/mirrorlist 
