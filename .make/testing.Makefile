#
##@ Testing Targets
#

.PHONY: test test-lint test-vagrant test-push-docker-image test-build-docker-image

DOCKER_IMAGE_NAME := "warhorse-circleci"
DOCKER_HUB_REPOSITORY_NAME := "warhorse-circleci"

test: test-lint test-vagrant ## Run all actively testing targets

test-lint: ## Run linter for the setup configuration
	@echo Run linter...
	@pre-commit run check-yaml --all-files
	@pre-commit run ansible-lint --all-files
	@pre-commit run vagrant --all-files
	@pre-commit run circleci-config-validate --all-files
	@pre-commit run dockerfilelint --all-files

test-vagrant-provide: test-vagrant-headless ## Run provision in Vagrant machine (forwards ROLE & BOOK variable) (allows FAST mode)
	@ROLE=$(ROLE) BOOK=$(BOOK) vagrant provision
	@if [[ -z "$(FAST)" ]]; then \
		vagrant suspend; \
	else \
		printf "\n"; \
		printf "\033[0;31m +-----------------------------------------------------------+\n"; \
		printf "\033[0;31m |...........................................................|\n"; \
		printf "\033[0;31m |. Don't forget to suspend/halt/destroy the machine later! .|\n"; \
		printf "\033[0;31m |...........................................................|\n"; \
		printf "\033[0;31m +-----------------------------------------------------------+\n"; \
		printf "\n"; \
	fi

test-vagrant-headless: ## Starts the Vagrant machine in headless mode. Depends on the current machine state.
	@echo Evaluate Vagrant machine status...
	@vagrant status | grep -q -E 'paused|saved' && vagrant resume --no-provision || true
	@vagrant status | grep -q -E 'not created|shutoff|poweroff|aborted' && vagrant up --no-provision || true

test-vagrant-gui: ## Starts Vagrant machine with GUI. Shuts down eventual running headless machine.
	@vagrant halt
	@GUI=true vagrant up --no-provision

test-vagrant-remove-test-data: test-vagrant-headless ## Removes test data copied during provision
	@vagrant ssh -- 'bash -s ' < ./scripts/vagrant-remove-test-data.sh

test-push-docker-image: test-build-docker-image ## Upload the most recent image version to DockerHub
	@echo Upload new build image to DockerHub...
	@docker login
	@docker tag $(DOCKER_IMAGE_NAME) $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)
	@docker push $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)


test-build-docker-image: ## Build new version of the Docker image for CircleCI
	@echo Build Docker image...
	@docker build --tag $(DOCKER_IMAGE_NAME) --file ./.circleci/Dockerfile .
