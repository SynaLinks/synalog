#!/usr/bin/env python3
"""Generate plots from benchmark results.

Usage:
    python3 plot_benchmark.py
"""

import json
from pathlib import Path

try:
    import matplotlib.pyplot as plt
    import numpy as np
except ImportError:
    print("Please install matplotlib: pip install matplotlib")
    exit(1)

SCRIPT_DIR = Path(__file__).parent
RESULTS_FILE = SCRIPT_DIR / "docs" / "benchmark" / "results.json"
OUTPUT_DIR = SCRIPT_DIR / "docs" / "benchmark"


def load_results():
    """Load benchmark results from JSON."""
    with open(RESULTS_FILE) as f:
        return json.load(f)


def _geomean(values):
    """Geometric mean — the average used for per-program speedup ratios."""
    values = [v for v in values if v > 0]
    return float(np.exp(np.mean(np.log(values)))) if values else 0.0


def plot_speedup_by_engine(results):
    """Plot speedup comparison by engine."""
    engines = []
    parse_speedups = []
    compile_speedups = []

    for engine, tests in results["engines"].items():
        valid_parse = [(t["python_parse_ms"], t["rust_parse_ms"])
                       for t in tests
                       if t["python_parse_ms"] > 0 and t["rust_parse_ms"] > 0]
        valid_compile = [(t["python_compile_ms"], t["rust_compile_ms"])
                         for t in tests
                         if t["python_compile_ms"] > 0 and t["rust_compile_ms"] > 0]

        if valid_parse and valid_compile:
            engines.append(engine.upper())
            # Geometric mean of per-program speedups, matching summary.md (each
            # program weighted equally rather than by its absolute time).
            parse_speedups.append(_geomean([p / r for p, r in valid_parse]))
            compile_speedups.append(_geomean([p / r for p, r in valid_compile]))

    x = np.arange(len(engines))
    width = 0.35

    fig, ax = plt.subplots(figsize=(12, 6))
    bars1 = ax.bar(x - width/2, parse_speedups, width, label='Parse', color='#2ecc71')
    bars2 = ax.bar(x + width/2, compile_speedups, width, label='Compile', color='#3498db')

    ax.set_ylabel('Speedup (Python time / Rust time)', fontsize=12)
    ax.set_title('Rust vs Python Synalog: Speedup by SQL Engine', fontsize=14, fontweight='bold')
    ax.set_xticks(x)
    ax.set_xticklabels(engines)
    ax.legend()
    ax.axhline(y=1, color='red', linestyle='--', alpha=0.5, label='Baseline (1x)')

    # Add value labels on bars
    for bar in bars1:
        height = bar.get_height()
        ax.annotate(f'{height:.1f}x',
                    xy=(bar.get_x() + bar.get_width() / 2, height),
                    xytext=(0, 3), textcoords="offset points",
                    ha='center', va='bottom', fontsize=9)
    for bar in bars2:
        height = bar.get_height()
        ax.annotate(f'{height:.1f}x',
                    xy=(bar.get_x() + bar.get_width() / 2, height),
                    xytext=(0, 3), textcoords="offset points",
                    ha='center', va='bottom', fontsize=9)

    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "speedup_by_engine.png", dpi=150)
    plt.close()


def plot_time_comparison(results):
    """Plot absolute time comparison."""
    all_tests = []
    for engine, tests in results["engines"].items():
        for t in tests:
            if t["python_compile_ms"] > 0 and t["rust_compile_ms"] > 0:
                all_tests.append({
                    "name": f"{engine}/{t['file']}",
                    "python": t["python_compile_ms"],
                    "rust": t["rust_compile_ms"],
                })

    # Sort by Python time (descending)
    all_tests.sort(key=lambda x: x["python"], reverse=True)

    # Take top 20 slowest
    top_tests = all_tests[:20]

    fig, ax = plt.subplots(figsize=(14, 8))

    y = np.arange(len(top_tests))
    height = 0.35

    bars1 = ax.barh(y - height/2, [t["python"] for t in top_tests], height,
                    label='Python', color='#e74c3c')
    bars2 = ax.barh(y + height/2, [t["rust"] for t in top_tests], height,
                    label='Rust', color='#2ecc71')

    ax.set_xlabel('Time (ms)', fontsize=12)
    ax.set_title('Compilation Time: Top 20 Slowest Tests', fontsize=14, fontweight='bold')
    ax.set_yticks(y)
    ax.set_yticklabels([t["name"] for t in top_tests], fontsize=8)
    ax.legend()
    ax.invert_yaxis()

    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "time_comparison.png", dpi=150)
    plt.close()


def plot_speedup_distribution(results):
    """Plot distribution of speedups."""
    speedups = []
    for engine, tests in results["engines"].items():
        for t in tests:
            if t["python_compile_ms"] > 0 and t["rust_compile_ms"] > 0:
                speedups.append(t["python_compile_ms"] / t["rust_compile_ms"])

    fig, ax = plt.subplots(figsize=(10, 6))

    ax.hist(speedups, bins=30, color='#3498db', edgecolor='white', alpha=0.7)
    ax.axvline(x=np.median(speedups), color='red', linestyle='--',
               label=f'Median: {np.median(speedups):.1f}x')
    # Geometric mean is the headline aggregate (see summary.md); the arithmetic
    # mean is shown too, as it sits higher whenever the tail is right-skewed.
    ax.axvline(x=_geomean(speedups), color='green', linestyle='--',
               label=f'Geomean: {_geomean(speedups):.1f}x')
    ax.axvline(x=np.mean(speedups), color='gray', linestyle=':',
               label=f'Mean: {np.mean(speedups):.1f}x')

    ax.set_xlabel('Speedup (Python time / Rust time)', fontsize=12)
    ax.set_ylabel('Number of Tests', fontsize=12)
    ax.set_title('Distribution of Compilation Speedups', fontsize=14, fontweight='bold')
    ax.legend()

    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "speedup_distribution.png", dpi=150)
    plt.close()


def plot_summary(results):
    """Plot summary statistics."""
    if "summary" not in results:
        return

    s = results["summary"]

    fig, axes = plt.subplots(1, 3, figsize=(16, 5))

    # Parse times
    ax1 = axes[0]
    times = [s.get("python_parse_total_ms", 0), s.get("rust_parse_total_ms", 0)]
    bars = ax1.bar(["Python", "Rust"], times, color=['#e74c3c', '#2ecc71'])
    ax1.set_ylabel('Total Time (ms)', fontsize=12)
    ax1.set_title(f'Parse Time (Rust {s.get("parse_speedup", 0):.1f}x faster)',
                  fontsize=12, fontweight='bold')
    for bar, time_val in zip(bars, times):
        ax1.annotate(f'{time_val:.0f}ms',
                     xy=(bar.get_x() + bar.get_width() / 2, time_val),
                     xytext=(0, 3), textcoords="offset points",
                     ha='center', va='bottom', fontsize=10)

    # Compile times
    ax2 = axes[1]
    times = [s.get("python_compile_total_ms", 0), s.get("rust_compile_total_ms", 0)]
    bars = ax2.bar(["Python", "Rust"], times, color=['#e74c3c', '#2ecc71'])
    ax2.set_ylabel('Total Time (ms)', fontsize=12)
    ax2.set_title(f'Compile Time (Rust {s.get("compile_speedup", 0):.1f}x faster)',
                  fontsize=12, fontweight='bold')
    for bar, time_val in zip(bars, times):
        ax2.annotate(f'{time_val:.0f}ms',
                     xy=(bar.get_x() + bar.get_width() / 2, time_val),
                     xytext=(0, 3), textcoords="offset points",
                     ha='center', va='bottom', fontsize=10)

    # Verify times (Rust-only — Python Logica has no standalone verifier)
    ax3 = axes[2]
    times = [0, s.get("rust_check_total_ms", 0)]
    bars = ax3.bar(["Python", "Rust"], times, color=['#bdc3c7', '#2ecc71'])
    ax3.set_ylabel('Total Time (ms)', fontsize=12)
    ax3.set_title('Verify Time (Rust-only — no Python equivalent)',
                  fontsize=12, fontweight='bold')
    ax3.annotate('n/a',
                 xy=(bars[0].get_x() + bars[0].get_width() / 2, 0),
                 xytext=(0, 3), textcoords="offset points",
                 ha='center', va='bottom', fontsize=10, color='#7f8c8d')
    ax3.annotate(f'{times[1]:.0f}ms',
                 xy=(bars[1].get_x() + bars[1].get_width() / 2, times[1]),
                 xytext=(0, 3), textcoords="offset points",
                 ha='center', va='bottom', fontsize=10)

    plt.suptitle(f'Python vs Rust Synalog Benchmark ({s["total_tests"]} tests)',
                 fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "summary.png", dpi=150)
    plt.close()


def plot_verify_by_engine(results):
    """Plot the Rust-only verification time per engine."""
    engines = []
    check_totals = []
    for engine, tests in results["engines"].items():
        valid = [t["rust_check_ms"] for t in tests
                 if t.get("rust_check_ms", -1) > 0]
        if valid:
            engines.append(engine.upper())
            check_totals.append(sum(valid))

    if not engines:
        return

    fig, ax = plt.subplots(figsize=(12, 6))
    bars = ax.bar(engines, check_totals, color='#9b59b6')
    ax.set_ylabel('Total verify time (ms)', fontsize=12)
    ax.set_title('Synalog Verification Time by SQL Engine (Rust `synalog.check`)',
                 fontsize=14, fontweight='bold')
    for bar, val in zip(bars, check_totals):
        ax.annotate(f'{val:.0f}ms',
                    xy=(bar.get_x() + bar.get_width() / 2, val),
                    xytext=(0, 3), textcoords="offset points",
                    ha='center', va='bottom', fontsize=9)

    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "verify_by_engine.png", dpi=150)
    plt.close()


def main():
    if not RESULTS_FILE.exists():
        print(f"Results file not found: {RESULTS_FILE}")
        print("Run 'python3 benchmark.py' first to generate results.")
        return

    OUTPUT_DIR.mkdir(exist_ok=True)

    print("Loading benchmark results...")
    results = load_results()

    print("Generating plots...")
    plot_summary(results)
    print("  - summary.png")

    plot_speedup_by_engine(results)
    print("  - speedup_by_engine.png")

    plot_verify_by_engine(results)
    print("  - verify_by_engine.png")

    plot_time_comparison(results)
    print("  - time_comparison.png")

    plot_speedup_distribution(results)
    print("  - speedup_distribution.png")

    print(f"\nPlots saved to: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
