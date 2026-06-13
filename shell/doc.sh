#!/bin/bash
set -Eeuo pipefail

cd "$(dirname "$0")/.."

# Create the project virtualenv if it doesn't exist yet.
[ -d .venv ] || uv venv

uv pip install zensical
uv pip install duckdb
uv pip install maturin

# Build and install synalog from the local crate (needed by the examples harness).
uv run maturin develop --release

# Regenerate documentation examples: run every docs/examples/*.l and write the .log files.
uv run python docs/examples/run.py

uv run zensical serve
