#!/bin/bash
#
#
# Check that base-devel is installed
printf "Ensuring that base-devel is installed... \n"
sudo pacman -S --needed git base-devel


#
#
# Install and build yay
printf "installing yay... \n"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
printf "yay has been installed. \n"


#
#
# Clean up install files
printf "Cleaning up install files... \n"
cd ..
echo "y" | rm -r yay
printf "Cleanup completed. \n"


#
#
# Perform frst-time use setup
printf "Configuring yay... \n"
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
printf "Configuration completed. \n"


