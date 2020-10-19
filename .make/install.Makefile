#
##@ Installation Targets
#

.PHONY: install install-provision install-testing install-yay

install: install-provision install-testing ## Setup everything for this project

install-provision: install-yay ## Setup tools for provisioning
	@echo Install Ansible with plugins...
	@yay -S --needed --noconfirm ansible ansible-aur-git

install-testing: install-yay ## Setup tools for testing
	@echo Install Pre-commit and its hooks...
	@yay -S --needed --noconfirm python-pre-commit --overwrite='*'
	@pre-commit install
	@pre-commit install-hooks
	@echo Install Vagrant with middleware
	@yay -S --needed --noconfirm vagrant virtualbox virtualbox-host-modules-arch perl-net-ssleay
	@vagrant plugin install virtualbox
	@echo 'It might need a restart of the OS to make the network component working when building Vagrant!'
	@yay -S --needed --noconfirm circleci-cli-bin docker --overwrite='/usr/bin/circleci'

install-yay: ## Setup Yay as AUR helper (dependency for other targets)
	@if ! command -v yay >/dev/null; then \
		GO_DIRECTORY=$$(mktemp --directory) && \
		git clone https://aur.archlinux.org/yay.git /tmp/yay | true && \
		cd /tmp/yay && \
		GOPATH="$$GO_DIRECTORY" makepkg --syncdeps --install --needed --noconfirm; \
	fi
