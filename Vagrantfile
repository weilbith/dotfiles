$script = <<-SCRIPT
set -e
sudo pacman -S --needed --noconfirm --quiet base-devel git 2> /dev/null
cd /vagrant
make install-provision
make provide-all
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "warhorse"
  config.vm.provider "virtualbox"
  config.vm.provision "shell",
    inline: $script,
    privileged: false
  config.vm.synced_folder ".", "/vagrant",
    type: "rsync",
    rsync__exclude: [".git/", "old_to_migrate/"]
end
