#!/usr/bin/env bash
set -euo pipefail

# ── SynaLog Full Test Suite ──────────────────────────────
#
# Usage:
#   ./test.sh              Run all tests
#   ./test.sh unit         Unit tests only (fast)
#   ./test.sh golden       Golden reference tests only (parser + compiler)
#   ./test.sh cli          CLI tests (needs the wheel installed)
#   ./test.sh e2e          End-to-end tests against live SQL engines
#   ./test.sh quick        Unit + parser golden (no SQL compilation)
#
# The e2e step needs the Python wheel installed (pip install .); it starts
# the server engines itself via docker compose (see tests/e2e/README in
# tests/e2e/conftest.py for details).

BOLD='\033[1m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

pass() { echo -e "${GREEN}✓${RESET} $1"; }
fail() { echo -e "${RED}✗${RESET} $1"; }
header() { echo -e "\n${BOLD}═══ $1 ═══${RESET}\n"; }

MODE="${1:-all}"
EXIT_CODE=0

run_step() {
    local label="$1"
    shift
    if "$@" 2>&1; then
        pass "$label"
    else
        fail "$label"
        EXIT_CODE=1
    fi
}

# ── Unit tests ───────────────────────────────────────────
if [[ "$MODE" == "all" || "$MODE" == "unit" || "$MODE" == "quick" ]]; then
    header "Unit Tests"
    run_step "cargo test --lib" cargo test --lib
fi

# ── Parser golden tests ─────────────────────────────────
if [[ "$MODE" == "all" || "$MODE" == "golden" || "$MODE" == "quick" ]]; then
    header "Parser Golden Tests"
    run_step "parser_tests" cargo test --test parser_tests
fi

# ── Compiler golden tests + other integration suites ─────
if [[ "$MODE" == "all" || "$MODE" == "golden" ]]; then
    header "Compiler Golden Tests"
    run_step "compiler_tests" cargo test --test compiler_tests
    run_step "search_tests" cargo test --test search_tests
    run_step "verifier_tests" cargo test --test verifier_tests
fi

# ── CLI tests ────────────────────────────────────────────
if [[ "$MODE" == "all" || "$MODE" == "cli" ]]; then
    header "CLI Tests"
    run_step "pytest tests/cli" python3 -m pytest tests/cli -q
fi

# ── End-to-end tests against live engines ────────────────
if [[ "$MODE" == "all" || "$MODE" == "e2e" ]]; then
    header "End-to-End Tests (sqlite, duckdb, psql, trino, presto)"
    run_step "engines up" docker compose -f tests/e2e/docker-compose.yml up -d --wait
    run_step "pytest tests/e2e" python3 -m pytest tests/e2e -q
fi

# ── Summary ──────────────────────────────────────────────
echo ""
if [[ $EXIT_CODE -eq 0 ]]; then
    echo -e "${GREEN}${BOLD}All tests passed.${RESET}"
else
    echo -e "${RED}${BOLD}Some tests failed.${RESET}"
fi

exit $EXIT_CODE
