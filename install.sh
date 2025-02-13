#!/bin/bash
echo "Installing packages..."
sudo pacman -S --needed hyprland waybar rofi hyprpaper hyprlock wlogout neofetch kitty NetworkManager alsa-utils pavucontrol cmatrix neovim kwrite thunar base-devel git fftw alsa-lib iniparser pulseaudio pkgconf nano stow
echo "Success"

echo "Installing yay..."
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
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
        sudo pacman -S --needed gcc python okular
	yay -S --needed spotify spiceify github-desktop-bin spotify-adblock brave-bin vesktop shotcut sidequest-bin visual-studio-code-bin
	echo "Success"
else
	echo "Skipping additional packages."
fi

cd ~/dotfiles
stow .
echo "Done! Config installed"
