#
##@ Provision Targets
#

.PHONY: provide provide-book provide-book-list provide-role provide-role-list


ASK_BECOME_PASS_ARG := $(shell [ $$USER != 'vagrant' -a $$USER != 'circleci' ] && echo '--ask-become-pass' || echo '')

provide: ## Provide everything
	@ansible-playbook ./main.yaml $(ASK_BECOME_PASS_ARG)

provide-book: ## Provide a specific playbook (add BOOK=<name-here>) (checkout 'provide-book-list')
	@ansible-playbook ./playbooks/${BOOK}.yaml $(ASK_BECOME_PASS_ARG)

provide-book-list: ## List playbook names that can be targeted
	@find ./playbooks -type f  -exec basename {} .yaml \;

provide-role: ## Provide a specific role (add ROLE=<name-here>) (checkout 'provide-role-list')
	@ansible-playbook ./main.yaml --tags=$(ROLE) $(ASK_BECOME_PASS_ARG)

provide-role-list: ## List role names that can be targeted
	@find ./roles/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \; | grep --invert-match 'base_role'
