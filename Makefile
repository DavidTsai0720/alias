BREW_PACKAGES = \
	cookiecutter \
	docker-compose \
	awscli \
	pre-commit \
	tree \
	nvm \
	tfenv \
	kubectl \
	shellcheck \
	prettier \
	terraform-docs \
	bison \
	helm \
	plantuml \
	newman \

.PHONY: install
install:
	@echo "Installing brew packages..."
	@brew install $(BREW_PACKAGES)

.PHONY: setup
setup:
	@echo "Setting up..."
	@ln -s .cspell.json ~/.cspell.json
	@ln -s .inputrc ~/.inputrc