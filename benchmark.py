#!/usr/bin/env python3
"""Benchmark the synalog Rust core against the Python logica package.

Both implementations run in-process: synalog through its PyO3 extension
(`synalog.parse` / `synalog.compile`), logica through its Python modules.
Each compiler-test fixture is benchmarked once per engine, with the
`@Engine` annotation prepended so both sides compile for the same dialect.

Results are stored under docs/benchmark/ (raw results.json plus a generated
summary.md) so the documentation's Benchmark page always displays the latest
run; plot_benchmark.py renders the PNGs next to them.

Usage:
    python3 benchmark.py            # run the benchmarks and export to docs
    python3 benchmark.py --export   # regenerate summary.md from existing results
    python3 benchmark.py --plot     # generate plots from existing results
"""

import json
import math
import os
import statistics
import sys
import time
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
COMPILER_TESTS_DIR = SCRIPT_DIR / "tests" / "compiler_tests"
FIXTURES_DIR = COMPILER_TESTS_DIR / "fixtures"
DOCS_BENCH_DIR = SCRIPT_DIR / "docs" / "benchmark"
OUTPUT_FILE = DOCS_BENCH_DIR / "results.json"
SUMMARY_FILE = DOCS_BENCH_DIR / "summary.md"

ENGINES = ["sqlite", "duckdb", "psql", "bigquery", "trino", "presto"]
RUNS_PER_TEST = 3

# Set up Python Logica - must set LOGICAPATH and chdir for imports to work
os.environ['LOGICAPATH'] = str(COMPILER_TESTS_DIR)
os.chdir(COMPILER_TESTS_DIR)


def best_ms(timer, *args) -> float:
    """Lowest of RUNS_PER_TEST timed runs, after one discarded warm-up.

    The minimum is the standard estimator for CPU-bound microbenchmarks: it is
    the run least perturbed by GC, the scheduler and cold caches, so it reflects
    the work itself rather than ambient noise (the mean would bake that noise
    in). The warm-up run is discarded so one-time import/caching costs never land
    in the measurement.
    """
    timer(*args)  # warm-up (discarded)
    return min(timer(*args) for _ in range(RUNS_PER_TEST))


def geomean(values: list) -> float:
    """Geometric mean — the correct average for ratios like per-program speedups.

    Unlike a ratio of summed times (which the slowest few programs dominate) or
    an arithmetic mean of ratios (which is biased upward for ratio data), the
    geometric mean weights every program equally and is symmetric, so it answers
    "the typical speedup" rather than "the batch-throughput speedup".
    """
    return math.exp(sum(math.log(v) for v in values) / len(values)) if values else 0.0


def speedups(pairs: list) -> list:
    """Per-program speedup ratios (python_ms / rust_ms) from (python, rust) pairs."""
    return [py / rs for py, rs in pairs]


def time_python_parse(source: str) -> float:
    """Time Python Logica parser."""
    from logica.parser_py import parse as logica_parse

    start = time.perf_counter()
    logica_parse.ParseFile(source)
    end = time.perf_counter()
    return (end - start) * 1000  # ms


def time_python_compile(source: str, predicate: str) -> float:
    """Time Python Logica compiler."""
    from logica.parser_py import parse as logica_parse
    from logica.compiler import universe

    start = time.perf_counter()
    parsed = logica_parse.ParseFile(source)['rule']
    program = universe.LogicaProgram(parsed, user_flags={})
    program.FormattedPredicateSql(predicate)
    end = time.perf_counter()
    return (end - start) * 1000  # ms


def time_rust_parse(source: str, roots: list) -> float:
    """Time the synalog (Rust) parser through the PyO3 extension."""
    import synalog

    start = time.perf_counter()
    synalog.parse(source, import_root=roots)
    end = time.perf_counter()
    return (end - start) * 1000  # ms


def time_rust_compile(source: str, predicate: str, roots: list) -> float:
    """Time the synalog (Rust) compiler through the PyO3 extension."""
    import synalog

    start = time.perf_counter()
    synalog.compile(source, predicate, import_root=roots)
    end = time.perf_counter()
    return (end - start) * 1000  # ms


def time_rust_check(source: str, engine: str) -> float:
    """Time the synalog (Rust) verifier through the PyO3 extension.

    Synalog runs a dedicated safety/stratification/recursion pass
    (`synalog.check`) that Python Logica has no standalone equivalent for —
    its analysis is folded into compilation — so this stage is Rust-only.
    """
    import synalog

    start = time.perf_counter()
    synalog.check(source, engine)
    end = time.perf_counter()
    return (end - start) * 1000  # ms


def get_last_predicate(source: str) -> str:
    """Get the last user-defined predicate from source."""
    from logica.parser_py import parse as logica_parse

    parsed = logica_parse.ParseFile(source)['rule']
    last = None
    for rule in parsed:
        if 'head' in rule and 'predicate_name' in rule['head']:
            name = rule['head']['predicate_name']
            if not name.startswith('@') and not name.startswith('_'):
                # Skip imported predicates
                parts = name.split('_')
                if len(parts) >= 2 and parts[0][0].isupper():
                    if any(p and p[0].isupper() for p in parts[1:]):
                        continue
                last = name
    return last


def benchmark_file(filepath: Path, roots: list, engine: str) -> dict:
    """Benchmark a single test file for one engine."""
    raw = filepath.read_text()
    predicate = get_last_predicate(raw)

    if not predicate:
        return None

    # Same annotated source for both implementations: each compiles for
    # the engine declared in the program.
    source = f'@Engine("{engine}");\n' + raw

    result = {
        "file": filepath.name,
        "predicate": predicate,
    }

    # Each stage is the fastest of several warm runs (see best_ms).

    # Python parse
    try:
        result["python_parse_ms"] = best_ms(time_python_parse, source)
    except Exception as e:
        result["python_parse_ms"] = -1
        result["python_parse_error"] = str(e)

    # Python compile
    try:
        result["python_compile_ms"] = best_ms(time_python_compile, source, predicate)
    except Exception as e:
        result["python_compile_ms"] = -1
        result["python_compile_error"] = str(e)

    # Rust parse (catch BaseException: a Rust panic surfaces as PanicException,
    # which is not an Exception subclass and would otherwise abort the run).
    try:
        result["rust_parse_ms"] = best_ms(time_rust_parse, source, roots)
    except BaseException as e:
        result["rust_parse_ms"] = -1
        result["rust_parse_error"] = str(e)

    # Rust compile
    try:
        result["rust_compile_ms"] = best_ms(time_rust_compile, source, predicate, roots)
    except BaseException as e:
        result["rust_compile_ms"] = -1
        result["rust_compile_error"] = str(e)

    # Rust verify (synalog.check) — Rust-only stage, no Python counterpart.
    try:
        result["rust_check_ms"] = best_ms(time_rust_check, source, engine)
    except BaseException as e:
        result["rust_check_ms"] = -1
        result["rust_check_error"] = str(e)

    return result


def run_benchmarks():
    """Run all benchmarks."""
    roots = [str(COMPILER_TESTS_DIR)]
    results = {
        "metadata": {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "runs_per_test": RUNS_PER_TEST,
        },
        "engines": {}
    }

    # Skip the intentionally-invalid negative fixtures.
    l_files = sorted(
        f for f in FIXTURES_DIR.glob("*.l") if not f.stem.endswith("_fail")
    )
    for engine in ENGINES:
        print(f"\n=== Benchmarking {engine} ===")
        engine_results = []

        for l_file in l_files:
            print(f"  {l_file.name}...", end=" ", flush=True)
            result = benchmark_file(l_file, roots, engine)
            if result:
                engine_results.append(result)
                # Show speedup
                if result["rust_compile_ms"] > 0 and result["python_compile_ms"] > 0:
                    speedup = result["python_compile_ms"] / result["rust_compile_ms"]
                    print(f"Rust {speedup:.1f}x faster")
                else:
                    print("OK")
            else:
                print("SKIP (no predicate)")

        results["engines"][engine] = engine_results

    # Calculate summary statistics
    all_results = []
    for engine_results in results["engines"].values():
        all_results.extend(engine_results)

    valid_parse = [(r["python_parse_ms"], r["rust_parse_ms"])
                   for r in all_results
                   if r["python_parse_ms"] > 0 and r["rust_parse_ms"] > 0]
    valid_compile = [(r["python_compile_ms"], r["rust_compile_ms"])
                     for r in all_results
                     if r["python_compile_ms"] > 0 and r["rust_compile_ms"] > 0]

    if valid_parse:
        parse_ratios = speedups(valid_parse)
        results["summary"] = {
            "total_tests": len(all_results),
            "valid_parse_tests": len(valid_parse),
            "valid_compile_tests": len(valid_compile),
            "python_parse_total_ms": sum(p for p, _ in valid_parse),
            "rust_parse_total_ms": sum(r for _, r in valid_parse),
            # Geometric mean of per-program speedups is the headline metric: it
            # weights every program equally, unlike the total-time ratio below.
            "parse_speedup": geomean(parse_ratios),
            "parse_speedup_median": statistics.median(parse_ratios),
            "parse_speedup_total": (sum(p for p, _ in valid_parse)
                                    / sum(r for _, r in valid_parse)),
        }

    if valid_compile:
        compile_ratios = speedups(valid_compile)
        results["summary"].update({
            "python_compile_total_ms": sum(p for p, _ in valid_compile),
            "rust_compile_total_ms": sum(r for _, r in valid_compile),
            "compile_speedup": geomean(compile_ratios),
            "compile_speedup_median": statistics.median(compile_ratios),
            "compile_speedup_total": (sum(p for p, _ in valid_compile)
                                      / sum(r for _, r in valid_compile)),
        })

    valid_check = [r["rust_check_ms"] for r in all_results if r["rust_check_ms"] > 0]
    if valid_check and "summary" in results:
        results["summary"].update({
            "valid_check_tests": len(valid_check),
            "rust_check_total_ms": sum(valid_check),
        })

    # Write results
    DOCS_BENCH_DIR.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_FILE, 'w') as f:
        json.dump(results, f, indent=2)
    write_summary_markdown(results)

    print(f"\n{'='*50}")
    print("SUMMARY")
    print(f"{'='*50}")
    if "summary" in results:
        s = results["summary"]
        print(f"Total tests: {s['total_tests']}")
        print(f"Parse speedup (geomean): {s.get('parse_speedup', 0):.2f}x"
              f"  (median {s.get('parse_speedup_median', 0):.2f}x,"
              f" total {s.get('parse_speedup_total', 0):.2f}x)")
        print(f"Compile speedup (geomean): {s.get('compile_speedup', 0):.2f}x"
              f"  (median {s.get('compile_speedup_median', 0):.2f}x,"
              f" total {s.get('compile_speedup_total', 0):.2f}x)")
        print(f"Verify total (Rust-only): {s.get('rust_check_total_ms', 0):.0f} ms")
    print(f"\nResults written to: {OUTPUT_FILE}")


def write_summary_markdown(results):
    """Write the markdown summary included by the docs Benchmark page."""
    meta = results["metadata"]
    s = results.get("summary", {})
    lines = [
        f"*Last run: {meta['timestamp']} — {s.get('total_tests', 0)} programs"
        f" from the compiler test suite. Each measurement is the fastest of"
        f" {meta['runs_per_test']} runs after a warm-up; the headline speedup is"
        " the geometric mean of per-program speedups (every program weighted"
        " equally).*",
        "",
        "| | Python | Rust | Speedup (geomean) | (median) |",
        "| --- | --- | --- | --- | --- |",
        f"| Parse | {s.get('python_parse_total_ms', 0):.0f} ms"
        f" | {s.get('rust_parse_total_ms', 0):.0f} ms"
        f" | **{s.get('parse_speedup', 0):.1f}x**"
        f" | {s.get('parse_speedup_median', 0):.1f}x |",
        f"| Compile | {s.get('python_compile_total_ms', 0):.0f} ms"
        f" | {s.get('rust_compile_total_ms', 0):.0f} ms"
        f" | **{s.get('compile_speedup', 0):.1f}x**"
        f" | {s.get('compile_speedup_median', 0):.1f}x |",
        f"| Verify | — | {s.get('rust_check_total_ms', 0):.0f} ms"
        " | Rust-only | — |",
        "",
        "*The Python and Rust columns are summed wall-clock time across all"
        " programs (context, not the headline: a few large programs dominate"
        " that ratio). Verification (`synalog.check` — safety, stratification,"
        " recursion and reserved-name checks) is a Synalog-specific pass; Python"
        " Logica folds its analysis into compilation and has no standalone"
        " equivalent, so it is reported as a Rust-only total.*",
        "",
        "| Engine | Programs | Parse speedup | Compile speedup | Verify (Rust) |",
        "| --- | --- | --- | --- | --- |",
    ]
    for engine, tests in results["engines"].items():
        valid_parse = [(t["python_parse_ms"], t["rust_parse_ms"]) for t in tests
                       if t["python_parse_ms"] > 0 and t["rust_parse_ms"] > 0]
        valid_compile = [(t["python_compile_ms"], t["rust_compile_ms"]) for t in tests
                         if t["python_compile_ms"] > 0 and t["rust_compile_ms"] > 0]
        if not valid_parse or not valid_compile:
            continue
        parse_speedup = geomean(speedups(valid_parse))
        compile_speedup = geomean(speedups(valid_compile))
        check_total = sum(t["rust_check_ms"] for t in tests
                          if t.get("rust_check_ms", -1) > 0)
        lines.append(
            f"| {engine} | {len(tests)} | {parse_speedup:.1f}x"
            f" | {compile_speedup:.1f}x | {check_total:.0f} ms |"
        )
    DOCS_BENCH_DIR.mkdir(parents=True, exist_ok=True)
    SUMMARY_FILE.write_text("\n".join(lines) + "\n")
    print(f"Summary written to: {SUMMARY_FILE}")


if __name__ == "__main__":
    if "--plot" in sys.argv:
        # Import plot module
        exec(open(SCRIPT_DIR / "plot_benchmark.py").read())
    elif "--export" in sys.argv:
        with open(OUTPUT_FILE) as f:
            write_summary_markdown(json.load(f))
    else:
        run_benchmarks()
