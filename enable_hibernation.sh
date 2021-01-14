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
	echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab
fi
SWAP_UUID="$(sudo findmnt -no SOURCE,UUID -T /swapfile | cut -d' ' -f2)"
SWAP_OFFSET="$(sudo swap-offset /swapfile | cut -d' ' -f4)"
sudo rpl "quiet splash" "quiet splash resume=UUID=${SWAP_UUID} resume_offset=${SWAP_OFFSET}" /etc/default/grub
sudo update-grub
sudo touch /etc/initramfs-tools/conf.d/resume
echo "RESUME=UUID=${SWAP_UUID} resume_offset=${SWAP_OFFSET}" | sudo tee -a /etc/initramfs-tools/conf.d/resume
sudo update-initramfs -u -k all
sudo touch /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
echo "[Re-enable hibernate by default]" | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
echo "Identity=unix-user:*" | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
echo "Action=org.freedesktop.login1.*" | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
echo "ResultActive=yes" | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
