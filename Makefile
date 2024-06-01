BREW_PACKAGES = \
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

.PHONY: install
install:
	@echo "Installing brew packages..."
	@brew install $(BREW_PACKAGES)

.PHONY: install-homebrew
install-homebrew:
	@echo "Installing Homebrew..."
	@bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@test -d $(HOME)/.linuxbrew && eval $$($(HOME)/.linuxbrew/bin/brew shellenv)
	@test -d /home/linuxbrew/.linuxbrew && eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	@echo "eval \"\$$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
	@export PATH="/home/.linuxbrew/bin:$(PATH)"

.PHONY: install-gvm
install-gvm:
	@echo "Installing gvm..."
	@bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
	@echo "source $(HOME)/.gvm/scripts/gvm" >> ~/.bashrc
