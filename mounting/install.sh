# UDdisk
sudo pacman -S --noconfirm udisks2

sudo cp $(pwd)/99-udisks2.rules /etc/udev/rules.d/
sudo cp $(pwd)/media.conf /etc/tmpfiles.d/

sudo systemctl enable udisks2.service
sudo systemctl start udisks2.service

# Bashmount
trizen -S bashmount
BM_DIR=$HOME/.config/bashmount
mkdir -p $BM_DIR
ln -sf $(pwd)/bashmount $BM_DIR/config
