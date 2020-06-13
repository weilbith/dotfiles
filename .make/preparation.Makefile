#
##@ Preparation Targets
#

.PHONY: prepare-all prepare-editing prepare-provision prepare-testing

prepare-all: prepare-editing prepare-provision prepare-testing ## Prepare everything for provision, testing and general contribution

prepare-editing: install-trizen ## Prepare and setup tool-chain to edit project
	@echo Install Pre-commit and its hooks...
	@trizen -S --needed python-pre-commit --overwrite='*'
	@pre-commit install
	@pre-commit install-hooks

prepare-provision: install-trizen ## Prepare and setup tools for provisioning
	@echo Install Ansible with plugins...
	@trizen -S --needed ansible
	@trizen -S --needed ansible-aur-git

prepare-testing: ## Setup tools for testing
	@echo not implemented yet

install-trizen: ## Install Trizen as AUR helper
	@if ! command -v trizen >/dev/null; then \
		git clone https://aur.archlinux.org/trizen.git /tmp/trizen | true && \
		cd /tmp/trizen && \
		makepkg --syncdeps --install --needed; \
	fi
