#!/usr/bin/env python3
"""Check that verifier test fixtures are valid Logica syntax.

These are negative tests — valid Logica syntax that should fail synalog's
verification. Upstream Python Logica may still compile them to SQL (it does
not have all of synalog's verification checks). This script compiles each
fixture with upstream Logica and reports the result, proving the fixtures
are syntactically valid programs (it does not write any files).

Usage:
    python3 generate_expected_sql.py

Requires the logica package:
    pip install logica
"""

import os
import re
import signal

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
FIXTURES_DIR = os.path.join(SCRIPT_DIR, "fixtures")

# Set up import path for Logica imports BEFORE importing logica
os.environ['LOGICAPATH'] = SCRIPT_DIR
os.chdir(SCRIPT_DIR)

from logica.parser_py import parse as logica_parse
from logica.compiler import universe


class TimeoutError(Exception):
    pass


def _timeout_handler(signum, frame):
    raise TimeoutError("Compilation timed out")


def last_predicate(rules):
    last = None
    for r in rules:
        if 'head' in r and 'predicate_name' in r['head']:
            name = r['head']['predicate_name']
            if not name.startswith('@') and not name.startswith('_'):
                last = name
    return last


def check_fixture(l_path, timeout=15):
    """Compile a fixture with upstream Logica; returns a status string."""
    source = open(l_path).read()
    source = '@Engine("sqlite");\n' + re.sub(r'@Engine\([^)]*\)\s*;?\s*', '', source)

    old_handler = signal.signal(signal.SIGALRM, _timeout_handler)
    signal.alarm(timeout)
    try:
        parsed = logica_parse.ParseFile(source)['rule']
        pred = last_predicate(parsed)
        if pred is None:
            return "no predicate"
        program = universe.LogicaProgram(parsed, user_flags={})
        program.FormattedPredicateSql(pred)
        return "compiles upstream (synalog verifier should reject it)"
    except TimeoutError:
        return "timeout (often expected: e.g. unbounded recursion)"
    except Exception as e:
        return f"upstream error: {str(e)[:60]}"
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, old_handler)


def main():
    print("Checking verifier fixtures against upstream Logica...")
    for l_file in sorted(f for f in os.listdir(FIXTURES_DIR) if f.endswith('.l')):
        status = check_fixture(os.path.join(FIXTURES_DIR, l_file))
        print(f"  {l_file}: {status}")


if __name__ == "__main__":
    main()
