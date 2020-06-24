#
##@ Provision Targets
#

.PHONY: provide provide-group provide-list


ASK_BECOME_PASS_ARG := $(shell [ $$USER != 'vagrant' -a $$USER != 'circleci' ] && echo '--ask-become-pass' || echo '')

provide: ## Provide everything
	@ansible-playbook ./main.yaml $(ASK_BECOME_PASS_ARG)

provide-group: ## Provide a specific group (add GROUP=<name-here>)
	@ansible-playbook ./playbooks/${GROUP}.yaml $(ASK_BECOME_PASS_ARG)

provide-list: ## List group names that can be targeted
	@find ./playbooks -type f  -exec basename {} .yaml \;
