#!/bin/bash
sudo apt install -y --no-install-recommends rpl uswsusp	
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=$(cat /proc/meminfo | awk '/MemTotal/ {print $2}') count=1024 conv=notrunc
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
if sudo cat /etc/fstab | grep "/swapfile"; then
	echo "No need to update fstab"
else
	echo "Updating fstab"
	echo '/swapfile none swap defaults,discard 0 0' | sudo tee -a /etc/fstab
fi
SWAP_UUID="$(sudo findmnt -no UUID -T /swapfile)"
SWAP_OFFSET="$(sudo swap-offset /swapfile | cut -d' ' -f4)"
sudo rpl "quiet splash" "quiet splash resume=UUID=${SWAP_UUID} resume_offset=${SWAP_OFFSET}" /etc/default/grub
sudo update-grub
sudo touch /etc/initramfs-tools/conf.d/resume
echo "RESUME=UUID=${SWAP_UUID} resume_offset=${SWAP_OFFSET}" | sudo tee -a /etc/initramfs-tools/conf.d/resume
sudo update-initramfs -u -k all
echo "[Enable hibernate in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Enable hibernate in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
ResultActive=yes" | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla

