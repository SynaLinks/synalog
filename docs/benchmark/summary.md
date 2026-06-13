*Last run: 2026-06-13 10:26:51 — 498 programs from the compiler test suite, 3 runs per measurement.*

| | Python (total) | Rust (total) | Speedup |
| --- | --- | --- | --- |
| Parse | 12731 ms | 171 ms | **74.3x** |
| Compile | 57592 ms | 4489 ms | **12.8x** |
| Verify | — | 153 ms | Rust-only |

*Verification (`synalog.check` — safety, stratification, recursion and reserved-name checks) is a Synalog-specific pass; Python Logica folds its analysis into compilation and has no standalone equivalent, so it is reported as a Rust-only total.*

| Engine | Programs | Parse speedup | Compile speedup | Verify (Rust) |
| --- | --- | --- | --- | --- |
| sqlite | 83 | 74.1x | 11.7x | 26 ms |
| duckdb | 83 | 75.6x | 17.9x | 25 ms |
| psql | 83 | 73.4x | 13.3x | 25 ms |
| bigquery | 83 | 74.2x | 10.2x | 26 ms |
| trino | 83 | 74.4x | 9.7x | 25 ms |
| presto | 83 | 74.0x | 9.7x | 25 ms |
