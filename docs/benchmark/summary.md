*Last run: 2026-06-13 10:36:45 — 498 programs from the compiler test suite, 3 runs per measurement.*

| | Python (total) | Rust (total) | Speedup |
| --- | --- | --- | --- |
| Parse | 12888 ms | 176 ms | **73.1x** |
| Compile | 57907 ms | 4554 ms | **12.7x** |
| Verify | — | 163 ms | Rust-only |

*Verification (`synalog.check` — safety, stratification, recursion and reserved-name checks) is a Synalog-specific pass; Python Logica folds its analysis into compilation and has no standalone equivalent, so it is reported as a Rust-only total.*

| Engine | Programs | Parse speedup | Compile speedup | Verify (Rust) |
| --- | --- | --- | --- | --- |
| sqlite | 83 | 72.4x | 11.4x | 29 ms |
| duckdb | 83 | 74.6x | 17.8x | 27 ms |
| psql | 83 | 72.1x | 13.2x | 26 ms |
| bigquery | 83 | 73.1x | 10.2x | 27 ms |
| trino | 83 | 72.9x | 9.7x | 27 ms |
| presto | 83 | 73.4x | 9.7x | 27 ms |
