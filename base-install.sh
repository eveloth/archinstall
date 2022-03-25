#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
sed -i -e '178s/.//' -e '404s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo 'KEYMAP="ruwin_alt_sh-UTF-8"' >> /etc/vconsole.conf
echo 'FONT="ter-v20n"' >> /etc/vconsole.conf
echo "altair" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 altair.localdomain altair" >> /etc/hosts
echo root:password | chpasswd

pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font btop cmatrix

pacman -S xf86-video-amdgpu

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable cleanup.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable acpid

useradd -m eveloth
echo eveloth:password | chpasswd
usermod -aG libvirt eveloth

echo "eveloth ALL=(ALL) ALL" >> /etc/sudoers.d/eveloth

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
