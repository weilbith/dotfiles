#
##@ Testing Targets
#

.PHONY: test-all test-lint

test-all: test-lint ## Run all testing related targets

test-lint: ## Run linter for the setup configuration
	@echo Run linter...
	@pre-commit run check-yaml --all-files
	@pre-commit run ansible-lint --all-files

test-vagrant: ## Create or start the Vagrant machine and do provision
	@vagrant status | grep -q 'paused' && vagrant resume || true
	@vagrant status | grep -q -E 'not created|shutoff' && vagrant up || true
	@vagrant status | grep -q 'running' && vagrant provision || true
	@vagrant suspend
	@printf "\n"
	@printf "\033[0;31m +---------------------------------------------------------+\n"
	@printf "\033[0;31m |.........................................................|\n"
	@printf "\033[0;31m |...... Don't forget to halt/destroy the box later! ......|\n"
	@printf "\033[0;31m |.........................................................|\n"
	@printf "\033[0;31m +---------------------------------------------------------+\n"
	@printf "\n"
