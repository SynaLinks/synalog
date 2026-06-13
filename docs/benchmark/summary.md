*Last run: 2026-06-13 15:34:36 — 504 programs from the compiler test suite. Each measurement is the fastest of 3 runs after a warm-up; the headline speedup is the geometric mean of per-program speedups (every program weighted equally).*

| | Python | Rust | Speedup (geomean) | (median) |
| --- | --- | --- | --- | --- |
| Parse | 13416 ms | 152 ms | **87.1x** | 86.7x |
| Compile | 61307 ms | 5163 ms | **13.3x** | 13.7x |
| Verify | — | 157 ms | Rust-only | — |

*The Python and Rust columns are summed wall-clock time across all programs (context, not the headline: a few large programs dominate that ratio). Verification (`synalog.check` — safety, stratification, recursion and reserved-name checks) is a Synalog-specific pass; Python Logica folds its analysis into compilation and has no standalone equivalent, so it is reported as a Rust-only total.*

| Engine | Programs | Parse speedup | Compile speedup | Verify (Rust) |
| --- | --- | --- | --- | --- |
| sqlite | 84 | 85.1x | 13.1x | 26 ms |
| duckdb | 84 | 88.5x | 19.0x | 27 ms |
| psql | 84 | 86.9x | 15.2x | 26 ms |
| bigquery | 84 | 87.1x | 11.8x | 26 ms |
| trino | 84 | 87.1x | 11.2x | 26 ms |
| presto | 84 | 87.6x | 11.2x | 26 ms |
