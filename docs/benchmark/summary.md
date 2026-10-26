*Last run: 2026-10-24 21:00:49, 28614 programs from the compiler test suite. Each measurement is the fastest of 3 runs after a warm-up; the headline speedup is the geometric mean of per-program speedups (every program weighted equally).*

| | Python | Rust | Speedup (geomean) | (median) |
| --- | --- | --- | --- | --- |
| Parse | 230491 ms | 4138 ms | **52.1x** | 51.5x |
| Compile | 1117664 ms | 25664 ms | **50.9x** | 48.8x |
| Verify | n/a | 12131 ms | Rust-only | n/a |

*The Python and Rust columns are summed wall-clock time across all programs (context, not the headline: a few large programs dominate that ratio). Verification (`synalog.check`: safety, stratification, recursion and reserved-name checks) is a Synalog-specific pass; Python Logica folds its analysis into compilation and has no standalone equivalent, so it is reported as a Rust-only total.*

| Engine | Programs | Parse speedup | Compile speedup | Verify (Rust) |
| --- | --- | --- | --- | --- |
| sqlite | 4769 | 51.7x | 50.4x | 2055 ms |
| duckdb | 4769 | 52.0x | 102.0x | 2010 ms |
| psql | 4769 | 52.2x | 54.9x | 2011 ms |
| bigquery | 4769 | 52.7x | 41.8x | 2017 ms |
| trino | 4769 | 52.0x | 38.4x | 2012 ms |
| presto | 4769 | 52.0x | 38.3x | 2026 ms |
