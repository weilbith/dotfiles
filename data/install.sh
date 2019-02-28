# Git
sudo pacman -S git
ln -sf $(pwd)/git $XDG_CONFIG_HOME/

# Mounting
sudo pacman -S ntfs-3g
## UDisk
sudo pacman -S --noconfirm udisks2
sudo ln -sf $(pwd)/udisk/99-udisks2.rules /etc/udev/rules.d/
sudo ln -sf $(pwd)/usikd/media.conf /etc/tmpfiles.d/
sudo systemctl enable udisks2.service
sudo systemctl start udisks2.service

## BashMount
trizen -S bashmount
ln -sf $(pwd)/bashmount $XDG_CONFIG_HOME/

# Midnight Commander
# sudo pacman -S --noconfirm mc
# ln -sf $(pwd)/mc $XDG_CONFIG_HOME/
# $MC_SHARE=$HOME/.local/share/mc
# mkdir -p $MC_SHARE
# ln -sf $(pwd)/mc/skins $MC_SHARE/

# Ranger
sudo pacman -S ranger
pip install --user pillow paramiko
ln -sf "$(pwd)/ranger" "$XDG_CONFIG_HOME/"
