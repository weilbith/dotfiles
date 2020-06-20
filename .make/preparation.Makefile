#
##@ Preparation Targets
#

.PHONY: prepare-all prepare-editing prepare-provision prepare-testing

prepare-all: prepare-editing prepare-provision prepare-testing ## Prepare everything for provision, testing and general contribution

prepare-editing: install-trizen ## Prepare and setup tool-chain to edit project
	@echo Install Pre-commit and its hooks...
	@trizen -S --needed --noconfirm python-pre-commit --overwrite='*'
	@pre-commit install
	@pre-commit install-hooks

prepare-provision: install-trizen ## Prepare and setup tools for provisioning
	@echo Install Ansible with plugins...
	@trizen -S --needed --noconfirm ansible ansible-aur-git

prepare-testing: ## Setup tools for testing
	@echo Install Vagrant with middleware
	@trizen -S --needed --noconfirm vagrant libvirt qemu-headless dnsmasq ebtables dmidecode
	@sudo systemctl enable libvirtd.service
	@sudo systemctl start libvirtd.service
	@vagrant plugin install vagrant-libvirt
	@sudo usermod -a -G libvirt ${USER}
	@echo It might need a restart of the OS to make the network component working when building Vagrant!

install-trizen: ## Install Trizen as AUR helper
	@if ! command -v trizen >/dev/null; then \
		git clone https://aur.archlinux.org/trizen.git /tmp/trizen | true && \
		cd /tmp/trizen && \
		makepkg --syncdeps --install --needed --noconfirm; \
	fi
