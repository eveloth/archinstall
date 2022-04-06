#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Russia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

sudo localectl --no-convert set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

sudo pacman -S xorg sddm plasma plasma-wayland-session kde-applications firefox simplescreenrecorder obs-studio vlc kdenlive alacritty kitty discord qbittorrent zsh filelight spectacle xmonad-contrib picom nitrogen dmenu xmobar qutebrowser

yay -S snap-pac-grub snapper-gui audiorelay obinskit

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mNow please reboot...\e[0m"

