# just: https://just.systems

docs_build_dir := "docs_dist"
git_ignore_revs_file := ".git-blame-ignore-revs"

# List all recipes
default:
    @just --list --justfile {{ justfile() }}

# Set up the project
[group("dev")]
setup:
    git config blame.ignoreRevsFile {{ git_ignore_revs_file }}
    uv run pre-commit install

# Run all pre-commit hooks for staged files
[group("dev")]
hooks:
    uv run pre-commit run

# Lint all files
[group("dev")]
lint:
    uv run ruff check

# Format all files
[group("dev")]
fmt:
    just --unstable --fmt
    uv run ruff format

# Serve the documentation
[group("docs")]
docs-serve:
    uv run mkdocs serve

# Build the documentation
[group("docs")]
docs-build:
    uv run mkdocs build

# Remove the built documentation
[group("docs")]
docs-clean:
    rm -rf {{ docs_build_dir }}

# Run all tests
[group("tests")]
test:
    uv run pytest

# Run all tests with coverage and generate an HTML report
[group("tests")]
test-cov:
    uv run pytest --cov --no-cov-on-fail --cov-report=term --cov-report=html
