# Differences with Logica

Synalog is a fork of [Logica](https://logica.dev/) with a fast Rust core. It keeps Logica's syntax and semantics, with deliberate changes aimed at AI agents. For how both languages relate to classical Datalog, see [Differences with Datalog](differences-datalog.md).

## Named attributes only

Synalog doesn't support positional attributes like Logica or Datalog — it only uses **named attributes**, which reduce agent mistakes. This feature is optional in Logica; Synalog makes it mandatory.

```logica
# Synalog — always named
Employee(name:, salary:)

# Logica/Datalog positional style — not supported
Employee(x, y)
```

As a consequence, the compiled SQL uses **actual column names** rather than Logica's `col{i}` format, making the output compatible with existing database schemas.

## Pagination

Pagination is critical for AI agents with limited context windows. It also avoids loading large amounts of data into memory, enabling use on memory-constrained cloud infrastructure.

Synalog applies pagination at compile time via the `limit` and `offset` arguments of [`compile()`](python-api.md#compile). The limit is combined with the `@Limit` directive: `actual_limit = min(limit, @Limit)`.

## Compile-time verification

Synalog embeds a [formal verifier](verification.md) that catches structural errors before any SQL is generated — variable safety, safe negation and aggregation, stratification, arity consistency, and recursion safety. Logica defers these to the database at execution time.

## Performance

The compiler is written in Rust and exposed via PyO3, dramatically reducing compilation time compared to the Python implementation — which matters when an agent compiles programs inside a reasoning loop.
