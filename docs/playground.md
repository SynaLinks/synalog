# Playground

Write Synalog on the left, pick a target engine, and see the compiled SQL on the
right. Everything runs **in your browser** — the parser, compiler and verifier are
the very same Rust code shipped to WebAssembly, with no server and no data leaving
the page. There is no database attached, so the SQL is generated but not executed.

<div id="synalog-playground" data-noprint>
  <noscript>The playground requires JavaScript and WebAssembly.</noscript>
</div>

!!! tip "What to try"
    - Switch the **engine** dropdown to compare how the same program lowers to
      DuckDB, BigQuery, PostgreSQL, SQLite, Trino, Presto or Databricks.
    - Pick a different **predicate** to compile any concept or rule in the program.
    - Toggle **Verify** to run the safety/well-formedness checks described in
      [Verification](verification.md) and see the diagnostics inline.

`import` statements are disabled here (there is no filesystem in the browser);
everything else mirrors the [CLI](cli.md) and [Python API](python-api.md).
