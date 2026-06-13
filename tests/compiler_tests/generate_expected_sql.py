#!/usr/bin/env python3
"""Generate expected SQL golden files for compiler tests using Python Logica.

Layout: canonical engine-independent sources live in fixtures/*.l; each
engine directory holds the golden .sql files plus optional .l overrides for
programs that genuinely differ on that engine (and engine-only fixtures).

For each fixture, compiles the last user-defined predicate with the target
engine and writes the SQL to <engine>/<test_name>.sql.

Fixtures listed in SYNALOG_GOLDENS or ABSENT_GOLDENS (see DEVIATIONS.md) are
never overwritten by this script:
  - SYNALOG_GOLDENS deviate from upstream on purpose; regenerate them with
    `synalog.compile` instead.
  - ABSENT_GOLDENS document compiler subsystems synalog does not have yet.

Usage:
    python3 generate_expected_sql.py

Requires the logica package (GitHub main, see DEVIATIONS.md / project notes):
    pip install logica
"""

import glob
import os
import signal
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# Set up import path for Logica imports BEFORE importing logica
os.environ['LOGICAPATH'] = SCRIPT_DIR
os.chdir(SCRIPT_DIR)

from logica.parser_py import parse as logica_parse
from logica.compiler import universe

ENGINES = ["sqlite", "duckdb", "psql", "bigquery", "trino", "presto", "databricks"]

# Goldens intentionally generated from synalog, not upstream (DEVIATIONS.md).
SYNALOG_GOLDENS = {
    ("trino", "06_arrays"), ("trino", "23_combine"), ("trino", "48_split_function"),
    ("trino", "50_array_functions"), ("trino", "51_math_functions"),
    ("presto", "06_arrays"), ("presto", "23_combine"), ("presto", "48_split_function"),
    ("presto", "50_array_functions"), ("presto", "51_math_functions"),
    ("psql", "23_combine"),
}

# Goldens intentionally absent: synalog lacks the subsystem (DEVIATIONS.md).
ABSENT_GOLDENS = {
    ("duckdb", "35_recursive_annotated"),
    ("psql", "29_argmin_argmax"),
}


def user_predicates_from_rules(rules):
    """Return user-defined predicates from parsed rules, in definition order.

    Excludes imported predicates (which have prefixes like 'Module_name_Predicate').
    """
    seen = set()
    preds = []
    for r in rules:
        if 'head' in r and 'predicate_name' in r['head']:
            name = r['head']['predicate_name']
            # Skip annotations, internal predicates, and imported predicates
            # Imported predicates have format: Module_name_Predicate
            if name not in seen and not name.startswith('@') and not name.startswith('_'):
                parts = name.split('_')
                if len(parts) >= 2 and parts[0][0].isupper() and any(p[0].isupper() for p in parts[1:] if p):
                    continue
                seen.add(name)
                preds.append(name)
    return preds


class TimeoutError(Exception):
    pass


def _timeout_handler(signum, frame):
    raise TimeoutError("Compilation timed out")


import re as _re

def _strip_engine(source):
    """Remove @Engine(...) annotation from source."""
    return _re.sub(r'@Engine\([^)]*\)\s*;?\s*', '', source)


def fixture_stems(engine):
    """Canonical fixture stems plus the engine's overrides/engine-only fixtures."""
    stems = set()
    for pattern in ("fixtures/*.l", f"{engine}/*.l"):
        for path in glob.glob(pattern):
            stems.add(os.path.splitext(os.path.basename(path))[0])
    return sorted(stems)


def fixture_source(engine, stem):
    """Engine-specific override wins over the canonical fixture."""
    override = os.path.join(engine, f"{stem}.l")
    if os.path.exists(override):
        return override
    return os.path.join("fixtures", f"{stem}.l")


def generate_for_file(l_path, engine, timeout=30):
    """Try to compile a .l file. Returns (predicate, sql) or error tuple."""
    source = open(l_path).read()
    source = '@Engine("{}");\n{}'.format(engine, _strip_engine(source))

    old_handler = signal.signal(signal.SIGALRM, _timeout_handler)
    signal.alarm(timeout)
    try:
        parsed = logica_parse.ParseFile(source)['rule']

        preds = user_predicates_from_rules(parsed)
        if not preds:
            return None

        pred = preds[-1]
        program = universe.LogicaProgram(parsed, user_flags={})
        sql = program.FormattedPredicateSql(pred)
        return (pred, sql)
    except TimeoutError:
        return ("timeout", None)
    except Exception as e:
        return ("error", str(e))
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, old_handler)


def process_engine(engine):
    """Generate goldens for all of an engine's fixtures."""
    stems = fixture_stems(engine)
    print(f"\n=== Processing {engine} ({len(stems)} fixtures) ===")

    stats = {"ok": 0, "timeout": 0, "no_pred": 0, "error": 0, "protected": 0}
    errors = {}

    for stem in stems:
        if stem.endswith("_fail"):
            continue
        print(f"  {stem}...", end=" ", flush=True)

        if (engine, stem) in SYNALOG_GOLDENS or (engine, stem) in ABSENT_GOLDENS:
            stats["protected"] += 1
            print("SKIP (protected, see DEVIATIONS.md)")
            continue

        result = generate_for_file(fixture_source(engine, stem), engine)

        if result is None:
            stats["no_pred"] += 1
            print("SKIP (no predicates)")
            continue
        if result[0] == "timeout":
            stats["timeout"] += 1
            print("SKIP (timeout)")
            continue
        if result[0] == "error":
            stats["error"] += 1
            errors[stem] = result[1]
            print(f"ERROR: {result[1][:60]}...")
            continue

        pred, sql = result
        with open(os.path.join(engine, f"{stem}.sql"), 'w') as f:
            f.write(sql)

        stats["ok"] += 1
        print(f"OK ({pred})")

    return stats, errors


def main():
    print("Generating expected SQL for compiler tests...")

    all_stats = {}
    all_errors = {}

    for engine in ENGINES:
        if os.path.isdir(os.path.join(SCRIPT_DIR, engine)):
            stats, errors = process_engine(engine)
            all_stats[engine] = stats
            all_errors[engine] = errors

    print(f"\n{'='*50}")
    print("SUMMARY")
    print(f"{'='*50}")

    for engine, stats in all_stats.items():
        total = sum(stats.values())
        print(f"\n{engine.upper()}:")
        print(f"  OK:          {stats['ok']}/{total}")
        print(f"  Protected:   {stats['protected']}/{total}")
        print(f"  Timeout:     {stats['timeout']}/{total}")
        print(f"  No predicate:{stats['no_pred']}/{total}")
        print(f"  Errors:      {stats['error']}/{total}")

        if all_errors.get(engine):
            print(f"\n  Errors detail:")
            for name, err in all_errors[engine].items():
                print(f"    - {name}: {err[:80]}")

    print(f"\nSQL files written to engine directories")


if __name__ == "__main__":
    main()
