#
##@ Provision Targets
#

.PHONY:

provide-all: ## Provide everything
	@ansible-playbook ./main.yaml --ask-become-pass

provide-all-vagrant: ## Provide everything in Vagrant, excludes become password
	@ansible-playbook ./main.yaml

provide-group: ## Provide a specific group (add GROUP=<name-here>)
	@ansible-playbook ./playbooks/${GROUP}.yaml --ask-become-pass

provide-list: ## List group names that can be targeted
	@find ./playbooks -type f  -exec basename {} .yaml \;
