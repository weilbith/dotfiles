#
##@ Testing Targets
#

.PHONY: test-all test-lint

test-all: test-lint ## Run all testing related targets

test-lint: ## Run linter for the setup configuration
	@echo Run linter...
	@pre-commit run check-yaml --all-files
	@pre-commit run ansible-lint --all-files
	@pre-commit run vagrant --all-files

test-vagrant: ## Create or start the Vagrant machine and do provision
	@echo Evaluate Vagrant box status and run provision...
	@vagrant status | grep -q 'paused' && vagrant resume --no-provision || true
	@vagrant status | grep -q -E 'not created|shutoff' && vagrant up --no-provision || true
	@vagrant rsync
	@vagrant provision
	@printf "\n"
	@printf "\033[0;31m +-----------------------------------------------------------+\n"
	@printf "\033[0;31m |...........................................................|\n"
	@printf "\033[0;31m |... Don't forget to suspend/halt/destroy the box later! ...|\n"
	@printf "\033[0;31m |...........................................................|\n"
	@printf "\033[0;31m +-----------------------------------------------------------+\n"
	@printf "\n"
