BREW_PACKAGES = \
	awscli \
	pre-commit \
	tree \
	nvm \
	go \
	terraform \
	tfenv \
	liquibase \
	sqlc \
	kubectl \
	pipenv \
	golang-lint \
	pylint \
	shellcheck \
	prettier \
	terraform-docs \
	bison \
	clang-format \
	clang-tidy \
	openjdk \
	heml \
	maven \
	plantuml \

.PHONY: install
install:
	@echo "Installing brew packages..."
	@echo $(PATH)
	@brew install $(BREW_PACKAGES)
