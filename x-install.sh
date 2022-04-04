#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Russia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

#sudo localectl --no-convert set-x11-keymap us,ru "" grp:alt_shift_toggle

#git clone https://aur.archlinux.org/pikaur.git
#cd pikaur/
#makepkg -si 

sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

sudo pacman -S xorg sddm plasma plasma-wayland-session kde-applications firefox simplescreenrecorder obs-studio vlc kdenlive steam obsidian telegram-desktop alacritty kitty discord qbittorrent zsh filelight spectacle
sudo pacman -S xmonad-contrib picom nitrogen dmenu xmobar qutebrowser

yay -S snap-pac-grub snapper-gui audiorelay

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
