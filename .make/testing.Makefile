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

test-vagrant: ## Create or start the Vagrant machine and do provision (forwards ROLE and BOOK variable)
	@echo Evaluate Vagrant box status and run provision...
	@vagrant status | grep -q -E 'paused|saved' && vagrant resume --no-provision || true
	@vagrant status | grep -q -E 'not created|shutoff|poweroff' && vagrant up --no-provision || true
	@ROLE=$(ROLE) BOOK=$(BOOK) vagrant provision
	@vagrant suspend
	@printf "\n"
	@printf "\033[0;31m +-----------------------------------------------------------+\n"
	@printf "\033[0;31m |...........................................................|\n"
	@printf "\033[0;31m |....... Don't forget to halt/destroy the box later! .......|\n"
	@printf "\033[0;31m |...........................................................|\n"
	@printf "\033[0;31m +-----------------------------------------------------------+\n"
	@printf "\n"

test-push-docker-image: test-build-docker-image ## Upload the most recent image version to DockerHub
	@echo Upload new build image to DockerHub...
	@docker login
	@docker tag $(DOCKER_IMAGE_NAME) $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)
	@docker push $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)


test-build-docker-image: ## Build new version of the Docker image for CircleCI
	@echo Build Docker image...
	@docker build --tag $(DOCKER_IMAGE_NAME) --file ./.circleci/Dockerfile .
