BREW_PACKAGES = \
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

.PHONY: install
install:
	@echo "Installing brew packages..."
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	@test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	@echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
	@export PATH="$(HOME)/.linuxbrew/bin:$(PATH)"
	@brew install $(BREW_PACKAGES)
