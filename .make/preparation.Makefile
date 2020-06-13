#
##@ Preparation Targets
#

.PHONY: prepare-all prepare-provision prepare-testing

prepare-all: prepare-provision ## Prepare everything for provision, testing and general contribution

prepare-provision: ## Prepare ans setup tools for provisioning
	@echo Install Ansible...
	@trizen -S --needed ansible
	@echo Install Ansible plugins...
	@trizen -S --needed ansible-aur-git

prepare-testing: ## Setup tools for testing
	@echo not implemented yet


install-trizen: ## Install Trizen as AUR helper
	@if ! command -v trizen >/dev/null; then \
		git clone https://aur.archlinux.org/trizen.git /tmp/trizen | true && \
		cd /tmp/trizen && \
		makepkg --syncdeps --install --needed; \
	fi
