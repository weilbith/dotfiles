#
##@ Testing Targets
#

.PHONY: test-all test-lint

DOCKER_HUB_REPOSITORY_NAME := "warhorse-circleci"

test-all: test-lint ## Run all testing related targets

test-lint: ## Run linter for the setup configuration
	@echo Run linter...
	@pre-commit run check-yaml --all-files
	@pre-commit run ansible-lint --all-files
	@pre-commit run vagrant --all-files
	@pre-commit run circleci-config-validate --all-files

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

test-push-docker-image: test-build-docker-image ## Upload the most recent image version to DockerHub
	@echo Upload new build image to DockerHub...
	@docker login
	@docker_username=$$(docker info | sed '/Username:/!d;s/.* //')
	@image_version=$$(date +%s)
	@docker tag warhorse-circleci $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)
	@docker push $$(docker info | sed '/Username:/!d;s/.* //')/$(DOCKER_HUB_REPOSITORY_NAME)


test-build-docker-image: ## Build new version of the Docker image for CircleCI
	@echo Build Docker image...
	@docker build --tag warhorse-circleci --file ./.circleci/Dockerfile .
