Vagrant.configure("2") do |config|
  config.vm.box = "thore/ArchLinux-x86_64_20GB" # 'thore' is me ('weilbith' was taken...)
  config.vm.box_version = "0.2"
  config.vm.hostname = "warhorse"

  config.vm.provider :virtualbox do |vb|
    vb.gui = ENV['GUI'] || false
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  config.vm.provision "shell",
    path: "./scripts/vagrant-provision.sh",
    privileged: false,
    env: {BOOK:ENV['BOOK'], ROLE:ENV['ROLE']}
end
