$script = <<-SCRIPT
set -e

DOTFILE_DIRECTORY=$HOME/dotfiles

function updateSystemOnNewMachine() {
  local remember_update_file=/var/inital_update_done

  if [[ ! -f "$remember_update_file" ]]; then
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman --sync --refresh --sysupgrade --noconfirm
    sudo pacman --sync --clean --clean
    sudo touch "$remember_update_file"
  fi
}

function syncDataToHomeDirectory() {
  rm -rf "$DOTFILE_DIRECTORY"
  cp -rf /vagrant "$DOTFILE_DIRECTORY"
}

function installDependencies() {
  sudo pacman -S --needed --noconfirm --quiet base-devel git 2> /dev/null
  cd "$DOTFILE_DIRECTORY"
  make install-provision
}

function runProvision() {
  if [[ -n "$ROLE" ]]; then
    make provide-role ROLE="$ROLE"
  elif [[ -n "$BOOK" ]]; then
    make provide-book BOOK="$BOOK"
  else
    make provide
  fi
}

updateSystemOnNewMachine
syncDataToHomeDirectory
installDependencies
runProvision
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "thore/ArchLinux-x86_64_20GB" # 'thore' is me ('weilbith' was taken...)
  config.vm.box_version = "0.2"
  config.vm.hostname = "warhorse"
  config.vm.provider :virtualbox do |vb|
    vb.gui = ENV['GUI'] || false
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  config.vm.provision "shell",
    inline: $script,
    privileged: false,
    env: {BOOK:ENV['BOOK'], ROLE:ENV['ROLE']}
end
