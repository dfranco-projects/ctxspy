.DEFAULT_GOAL := help
.PHONY: help install lint format typecheck test check build release-dry clean

help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Sync the environment and install git hooks
	uv sync
	uv run pre-commit install --install-hooks --hook-type pre-commit --hook-type commit-msg

lint: ## Run ruff checks (no changes)
	uv run ruff check .
	uv run ruff format --check .

format: ## Auto-fix lint issues and format
	uv run ruff check --fix .
	uv run ruff format .

typecheck: ## Run mypy in strict mode
	uv run mypy src tests

test: ## Run the test suite with coverage
	uv run pytest

check: lint typecheck test ## Run all checks (lint + typecheck + test)

build: ## Build sdist and wheel
	uv build

release-dry: ## Preview the next semantic release without side effects
	uv run semantic-release --noop version

clean: ## Remove build artifacts and caches
	rm -rf dist build .pytest_cache .mypy_cache .ruff_cache .coverage
