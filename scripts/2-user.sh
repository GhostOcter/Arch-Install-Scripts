#!/usr/bin/env bash
#github-action genshdoc
#
# @file User
# @brief User customizations and AUR package installation.
echo -ne "
-------------------------------------------------------------------------
   █████╗ ██████╗  ██████╗██╗  ██╗████████╗██╗████████╗██╗   ██╗███████╗
  ██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║╚══██╔══╝██║   ██║██╔════╝
  ███████║██████╔╝██║     ███████║   ██║   ██║   ██║   ██║   ██║███████╗
  ██╔══██║██╔══██╗██║     ██╔══██║   ██║   ██║   ██║   ██║   ██║╚════██║
  ██║  ██║██║  ██║╚██████╗██║  ██║   ██║   ██║   ██║   ╚██████╔╝███████║
  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝    ╚═════╝ ╚══════╝
-------------------------------------------------------------------------
                    Automated Arch Linux Installer
                        SCRIPTHOME: Arch-Install-Scripts
-------------------------------------------------------------------------

Installing AUR Softwares
"
source $HOME/Arch-Install-Scripts/configs/setup.conf
pacman -S --noconfirm --needed yay

cat ~/Arch-Install-Scripts/pkg-files/pgks.txt | while read line
do
  echo "INSTALLING: ${line}"
  sudo yay -S --noconfirm --needed ${line}
done

echo "Installing custom config"
cd ~
git clone "https://github.com/GhostOcter/dotfiles"
mv -f dotfiles/* .
rm -rf dotfiles
echo "Done !"

export PATH=$PATH:~/.local/bin
echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 3-post-setup.sh
-------------------------------------------------------------------------
"
exit
