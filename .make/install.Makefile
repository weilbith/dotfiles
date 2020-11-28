#
##@ Installation Targets
#

.PHONY: install install-provision install-testing install-pikaur

install: install-provision install-testing ## Setup everything for this project

install-provision: install-pikaur ## Setup tools for provisioning
	@echo Install Ansible with plugins...
	@pikaur -S --needed --noconfirm ansible ansible-aur-git

install-testing: install-pikaur ## Setup tools for testing
	@echo Install Pre-commit and its hooks...
	@pikaur --sync --needed --noconfirm python-pre-commit --overwrite='*'
	# @pre-commit install
	# @pre-commit install-hooks
	@echo Install Vagrant with middleware
	@pikaur --sync --needed --noconfirm vagrant virtualbox virtualbox-host-modules-arch perl-net-ssleay
	@vagrant plugin install virtualbox
	@echo 'It might need a restart of the OS to make the network component working when building Vagrant!'
	@pikaur --sync --needed --noconfirm circleci-cli-bin docker --overwrite='/usr/bin/circleci'

install-pikaur: ## Setup Pikaur as AUR helper (dependency for other targets)
	@if ! command -v pikaur >/dev/null; then \
		git clone https://aur.archlinux.org/pikaur.git /tmp/pikaur | true && \
		cd /tmp/pikaur && \
		makepkg --syncdeps --install --needed --noconfirm; \
	fi
