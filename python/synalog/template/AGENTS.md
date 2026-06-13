# {{name}}

{{description}}

This project is a Synalog knowledge base: logic programs (`.l` files) compiled to SQL by the `synalog` CLI, querying the data files in `data/`.

**Before writing any Synalog, read `.agents/skills/synalog/SKILL.md`** — it contains the language reference, the CLI usage and the conventions used here.

## Layout

- `*.l` — top-level Synalog programs (three sections: tables, concepts, rules). `example.l` is a working starter.
- `lib/` — reusable modules imported by programs (`import lib.metrics.TotalByRegion;`).
- `data/` — source data files (csv, tsv, json, jsonl, parquet), loaded with `--load`.
- `.agents/skills/synalog/SKILL.md` — the Synalog skill (language + CLI reference).

## Workflow

1. Put source data in `data/`.
2. Write or edit a program.
3. Validate: `synalog program.l check` — always check before running; fix every reported error.
4. Run: `synalog program.l run Predicate --load table=data/file.csv` (or `run_to_csv` for machine-readable output).

Try the starter:

```bash
synalog example.l check
synalog example.l run TopRegion MonthlySales --load sales=data/sales.csv
```
