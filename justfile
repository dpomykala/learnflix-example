docs_build_dir := "./docs_dist"

# List all recipes
default:
    @just --list --justfile {{ justfile() }}

# Set up the project
[group("dev")]
setup:
    uv run pre-commit install

# Run all pre-commit hooks for staged files
[group("dev")]
fix:
    uv run pre-commit run

# Lint all files with Ruff
[group("dev")]
lint:
    uv run ruff check

# Format all files with Ruff
[group("dev")]
fmt:
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
