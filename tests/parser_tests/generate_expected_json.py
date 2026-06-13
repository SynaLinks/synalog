#!/usr/bin/env python3
"""Generate expected JSON golden files for parser tests using Python Logica.

Parsing is engine-independent, so there is a single canonical fixture set:
for each .l file in fixtures/, parses with upstream Logica and writes the
JSON AST next to it.

Usage:
    python3 generate_expected_json.py

Requires the logica package:
    pip install logica
"""

import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
FIXTURES_DIR = os.path.join(SCRIPT_DIR, "fixtures")
COMPILER_TESTS_DIR = os.path.join(SCRIPT_DIR, "..", "compiler_tests")

# Set up import path for Logica imports BEFORE importing logica
os.environ['LOGICAPATH'] = COMPILER_TESTS_DIR
os.chdir(COMPILER_TESTS_DIR)

from logica.parser_py import parse as logica_parse


def parse_file(filepath):
    """Parse a .l file and return the JSON AST."""
    with open(filepath) as f:
        source = f.read()
    return logica_parse.ParseFile(source)


def main():
    print("Generating expected JSON for parser tests (Python Logica)...")
    ok = 0
    errors = 0

    for l_file in sorted(f for f in os.listdir(FIXTURES_DIR) if f.endswith('.l')):
        base = os.path.splitext(l_file)[0]
        l_path = os.path.join(FIXTURES_DIR, l_file)
        json_path = os.path.join(FIXTURES_DIR, f"{base}.json")

        print(f"  {base}...", end=" ", flush=True)
        try:
            parsed = parse_file(l_path)
            with open(json_path, 'w') as f:
                json.dump(parsed, f, indent=2, sort_keys=True)
            print("OK")
            ok += 1
        except Exception as e:
            print(f"ERROR: {str(e)[:60]}")
            if os.path.exists(json_path):
                os.remove(json_path)
            errors += 1

    print(f"\nTOTAL: {ok} OK, {errors} errors")


if __name__ == "__main__":
    main()
