$script = <<-SCRIPT
set -e

sudo pacman -S --needed --noconfirm --quiet base-devel git 2> /dev/null
cp -rf /vagrant /home/vagrant/dotfiles
cd /home/vagrant/dotfiles
make install-provision

if [[ -z "$GROUP" ]]; then
  make provide
else
  make provide-group GROUP="$GROUP"
fi
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "warhorse"
  config.vm.provider "virtualbox"
  config.vm.provision "shell",
    inline: $script,
    privileged: false,
    env: {GROUP:ENV['GROUP']}
end
