#
##@ Provision Targets
#

.PHONY:

provide-all: ## Provide all dotfiles
	@ansible-playbook --inventory ./hosts ./main.yaml --ask-become-pass
