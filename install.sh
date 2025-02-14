#!/bin/bash
echo "Installing packages..."
sudo pacman -S --needed hyprland waybar rofi hyprpaper hyprlock wlogout neofetch kitty NetworkManager alsa-utils pavucontrol cmatrix neovim thunar base-devel git fftw alsa-lib iniparser pulseaudio pkgconf nano stow
echo "Success"

echo "Installing dependencies..."
yay -S --needed ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang-git hyprcursor-git hyprwayland-scanner-git xcb-util-errors hyprutils-git glaze hyprgraphics-git hyprshot
sudo pacman -S --needed aquamarine hyprlang hyprcursor hyprutils hyprgraphics
sudo pacman -S --needed gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog libgtk-3-dev gobject-introspection libgirepository1.0-dev libpulse libnl libappindicator-gtk3  libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower
yay -S --needed cava
echo "Success"

read -p "Do you want to install additional packages?(this is for me, you probably dont want/need these) (y/[N]): " INSTALL_ADDITIONAL
if [[ "$INSTALL_ADDITIONAL" == "y" || "$INSTALL_ADDITIONAL" == "Y" ]]; then
        echo "Installing additional packages... "
        sudo pacman -S --needed python okular kwrite
	yay -S --needed spotify spiceify github-desktop-bin spotify-adblock brave-bin vesktop shotcut sidequest-bin visual-studio-code-bin
	echo "Success"
else
	echo "Skipping additional packages."
fi

echo "Backing up old dotfiles"
cd ~
mkdir old-dotfiles-backup
mv ~/.config/hypr ~/old-dotfiles-backup
mv ~/.config/kitty ~/old-dotfiles-backup
mv ~/.config/ml4w ~/old-dotfiles-backup
mv ~/.config/ml4w-hyprland-settings ~/old-dotfiles-backup
mv ~/.config/neofetch ~/old-dotfiles-backup
mv ~/.config/nvim ~/old-dotfiles-backup
mv ~/.config/rofi ~/old-dotfiles-backup
mv ~/.config/waybar ~/old-dotfiles-backup
mv ~/.config/wlogout ~/old-dotfiles-backup
echo "Old dotfiles backed up to ~/old-dotfiles-backup"

echo "Using stow to make symlinks - THERE WILL BE ERRORS HERE"
cd ~/dotfiles
stow .
echo "Success"

echo "Copying themes"
cd ~
mkdir .themes
mkdir .icons
cp ~/dotfiles/.themes/Material-Black-Mango ~/.themes/
cp ~/dotfiles/.icons/Material-Black-Mango-Numix-FLAT ~/.icons

echo "Finished! It should all be working now (fingers crossed)"
