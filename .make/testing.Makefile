#
##@ Testing Targets
#

.PHONY: test-all test-lint

test-all: test-lint ## Run all testing related targets

test-lint: ## Run linter for the setup configuration
	@echo Run linter...
	@pre-commit run check-yaml --all-files
	@pre-commit run ansible-lint --all-files
