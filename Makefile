BREW_PACKAGES = \
	cookiecutter \
	docker-compose \
	pipenv \
	awscli \
	pre-commit \
	tree \
	nvm \
	go \
	tfenv \
	liquibase \
	sqlc \
	kubectl \
	pipenv \
	golangci-lint \
	pylint \
	shellcheck \
	prettier \
	terraform-docs \
	bison \
	clang-format \
	openjdk \
	helm \
	maven \
	plantuml \
	newman \

.PHONY: install
install:
	@echo "Installing brew packages..."
	@brew install $(BREW_PACKAGES)
