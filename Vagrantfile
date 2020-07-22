$script = <<-SCRIPT
set -e

sudo pacman -S --needed --noconfirm --quiet base-devel git 2> /dev/null
rm -rf dotfiles
cp -rf /vagrant dotfiles
cd dotfiles
make install-provision

if [[ -n "$ROLE" ]]; then
  make provide-role ROLE="$ROLE"
elif [[ -n "$BOOK" ]]; then
  make provide-book BOOK="$BOOK"
else
  make provide
fi
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "warhorse"
  config.vm.provider :virtualbox do |vb|
    vb.gui = ENV['GUI'] || false
  end
  config.vm.provision "shell",
    inline: $script,
    privileged: false,
    env: {BOOK:ENV['BOOK'], ROLE:ENV['ROLE']}
end
