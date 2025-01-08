docs_build_dir := "./docs_dist"

# List all recipes
default:
    @just --list --justfile {{ justfile() }}

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
