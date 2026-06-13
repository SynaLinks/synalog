*Last run: 2026-06-13 01:33:28 — 498 programs from the compiler test suite, 3 runs per measurement.*

| | Python (total) | Rust (total) | Speedup |
| --- | --- | --- | --- |
| Parse | 12965 ms | 174 ms | **74.6x** |
| Compile | 58537 ms | 4546 ms | **12.9x** |

| Engine | Programs | Parse speedup | Compile speedup |
| --- | --- | --- | --- |
| sqlite | 83 | 74.5x | 11.7x |
| duckdb | 83 | 75.0x | 18.1x |
| psql | 83 | 73.7x | 13.3x |
| bigquery | 83 | 75.5x | 10.3x |
| trino | 83 | 74.4x | 9.7x |
| presto | 83 | 74.6x | 9.8x |
