$script = <<-SCRIPT
set -e
sudo pacman -S --needed --noconfirm --quiet base-devel git 2> /dev/null
cd /vagrant
make prepare-provision
make provide-all-vagrant
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "warhorse"
  config.vm.provider "libvirt"
  config.vm.provision "shell",
    inline: $script,
    privileged: false
  config.vm.synced_folder ".", "/vagrant",
    type: "rsync",
    rsync__exclude: [".git/", "old_to_migrate/"]
end
