#
##@ Installation Targets
#

.PHONY: install install-provision install-testing

install: install-provision install-testing ## Setup everything for this project

install-provision: install-trizen ## Setup tools for provisioning
	@echo Install Ansible with plugins...
	@trizen -S --needed --noconfirm ansible ansible-aur-git

install-testing: install-trizen ## Setup tools for testing
	@echo Install Pre-commit and its hooks...
	@trizen -S --needed --noconfirm python-pre-commit --overwrite='*'
	@pre-commit install
	@pre-commit install-hooks
	@echo Install Vagrant with middleware
	@trizen -S --needed --noconfirm vagrant virtualbox virtualbox-host-modules-arch
	@vagrant plugin install virtualbox
	@echo 'It might need a restart of the OS to make the network component working when building Vagrant!'
	@trizen -S --needed --noconfirm circleci-cli-bin docker --overwrite='/usr/bin/circleci'

install-trizen: ## Setup Trizen as AUR helper (dependency for other targets)
	@if ! command -v trizen >/dev/null; then \
		git clone https://aur.archlinux.org/trizen.git /tmp/trizen | true && \
		cd /tmp/trizen && \
		makepkg --syncdeps --install --needed --noconfirm; \
	fi
