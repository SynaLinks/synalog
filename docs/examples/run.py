#!/usr/bin/env python3
"""Run every documentation example and capture its output.

Each ``.l`` file in this directory is a self-contained Synalog program with a
small header:

    # run: Pred1, Pred2     predicates to compile and execute (DuckDB)
    # load: file.csv as T   load a CSV from this directory into DuckDB
                            table T before executing the predicates
    # expect-errors         the program is intentionally invalid; assert that
                            check() reports errors and log them instead

For every example the script:

1. validates the program with ``synalog.check()``,
2. compiles each ``# run:`` predicate with ``synalog.compile()``,
3. executes the generated SQL in an in-memory DuckDB,
4. writes the combined, unedited output to ``<name>.log``.

The docs include both the ``.l`` source and the ``.log`` via pymdownx
snippets, so the examples shown on the site are guaranteed to run.

Usage:  python3 docs/examples/run.py [name ...]
Exits non-zero if any example fails to validate, compile or execute.
"""

import re
import sys
from pathlib import Path

import duckdb
import synalog

HERE = Path(__file__).parent


def parse_header(source: str) -> tuple[list[str], list[tuple[str, str]], bool]:
    predicates: list[str] = []
    loads: list[tuple[str, str]] = []
    expect_errors = False
    for line in source.splitlines():
        if m := re.match(r"#\s*run:\s*(.+)", line):
            predicates += [p.strip() for p in m.group(1).split(",") if p.strip()]
        if m := re.match(r"#\s*load:\s*(\S+)\s+as\s+(\w+)\s*$", line):
            loads.append((m.group(1), m.group(2)))
        if re.match(r"#\s*expect-errors\s*$", line):
            expect_errors = True
    return predicates, loads, expect_errors


def format_table(columns: list[str], rows: list[tuple]) -> str:
    cells = [[("" if v is None else str(v)) for v in row] for row in rows]
    widths = [
        max(len(col), *(len(r[i]) for r in cells)) if cells else len(col)
        for i, col in enumerate(columns)
    ]
    def fmt(row):
        return "| " + " | ".join(v.ljust(w) for v, w in zip(row, widths)) + " |"
    lines = [fmt(columns), "|" + "|".join("-" * (w + 2) for w in widths) + "|"]
    lines += [fmt(r) for r in cells]
    lines.append(f"({len(rows)} row{'s' if len(rows) != 1 else ''})")
    return "\n".join(lines)


def run_example(path: Path) -> None:
    source = path.read_text()
    predicates, loads, expect_errors = parse_header(source)
    out: list[str] = [f"$ synalog.check('{path.name}')"]

    errors = synalog.check(source)
    if expect_errors:
        if not errors:
            raise AssertionError(f"{path.name}: expected check() errors, got none")
        out += [f"{len(errors)} error(s) found:"]
        out += [f"  - {e}" for e in errors]
        path.with_suffix(".log").write_text("\n".join(out) + "\n")
        return
    if errors:
        raise AssertionError(f"{path.name}: check() failed: {errors}")
    out += ["No errors found."]
    if not predicates:
        raise AssertionError(f"{path.name}: no '# run:' header")

    conn = duckdb.connect()
    for filename, table in loads:
        csv_path = HERE / filename
        conn.execute(
            f"CREATE TABLE {table} AS SELECT * FROM read_csv('{csv_path}')"
        )
        count = conn.execute(f"SELECT count(*) FROM {table}").fetchone()[0]
        out += ["", f"-- Loaded {filename} into DuckDB table {table} ({count} rows)"]
    for predicate in predicates:
        sql = synalog.compile(source, predicate)
        if "CurrentDate" in sql:
            # The CurrentDate built-in concept compiles to a reference to a
            # CurrentDate(date) relation supplied by the runtime.
            conn.execute(
                "CREATE TABLE IF NOT EXISTS CurrentDate AS"
                " SELECT strftime(current_date, '%Y-%m-%d') AS date"
            )
        result = conn.execute(sql)
        rows = result.fetchall()
        columns = [d[0] for d in result.description]
        out += ["", f"$ synalog.compile('{path.name}', '{predicate}')", sql.strip()]
        out += ["", f"-- Executed on DuckDB:", format_table(columns, rows)]
    conn.close()

    path.with_suffix(".log").write_text("\n".join(out) + "\n")


def main() -> int:
    names = sys.argv[1:]
    files = sorted(
        p for p in HERE.glob("*.l") if not names or p.stem in names
    )
    if not files:
        print("no examples found", file=sys.stderr)
        return 1
    failed = 0
    for path in files:
        try:
            run_example(path)
            print(f"ok   {path.name}")
        except Exception as exc:  # noqa: BLE001 - report and keep going
            print(f"FAIL {path.name}: {exc}")
            failed += 1
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
