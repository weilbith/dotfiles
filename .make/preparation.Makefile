#
##@ Preparation Targets
#

.PHONY: prepare-all prepare-provision prepare-testing

prepare-all: ## Prepare everything for provision, testing and general contribution
	@echo all target

prepare-provision: ## Prepare ans setup tools for provisioning
	@echo Install Ansible and dependencies...
	@sudo pacman -S --needed ansible
	@echo Install Ansible-Galaxy roles
	@ansible-galaxy install kewlfft.aur

prepare-testing: ## Setup tools for testing
	@echo not implemented yet

