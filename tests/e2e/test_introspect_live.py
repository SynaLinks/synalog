"""Live end-to-end tests for `synalog introspect` against real servers.

These connect to the engines from docker-compose.yml here and check that
introspection reads a real catalog and emits valid, compilable Logica.

Engine availability follows the same rule as the rest of the e2e suite: a
test is skipped when its server is unreachable, unless the engine is listed in
SYNALOG_E2E_REQUIRE (then unreachable is a failure). See conftest.py.

  - psql   reads the `shop` / `analytics` schemas seeded by initdb/.
  - trino  / presto read the built-in `tpch` catalog (schemas sf1, tiny, ...).
"""

from __future__ import annotations

import os

import pytest

import synalog
from synalog.introspect import introspect


def _psql_dsn() -> str:
    port = os.environ.get("SYNALOG_E2E_PSQL_PORT", "5433")
    return f"postgresql://logica:logica@localhost:{port}/logica"


def _trino_dsn() -> str:
    host = os.environ.get("SYNALOG_E2E_TRINO_HOST", "localhost")
    port = os.environ.get("SYNALOG_E2E_TRINO_PORT", "8080")
    return f"trino://e2e@{host}:{port}/tpch"


def _presto_dsn() -> str:
    host = os.environ.get("SYNALOG_E2E_PRESTO_HOST", "localhost")
    port = os.environ.get("SYNALOG_E2E_PRESTO_PORT", "8081")
    return f"presto://e2e@{host}:{port}/tpch"


def test_introspect_psql_reads_seeded_schemas(runner_for):
    runner_for("psql")  # skip/fail per availability, like the golden e2e tests
    text = introspect("psql", _psql_dsn())

    # Schema-qualified predicate names, columns preserved in order.
    assert (
        "ShopCustomers(id:, full_name:, email:, created_at:)"
        " :- shop.customers(id:, full_name:, email:, created_at:);" in text
    )
    assert "ShopOrders(id:, customer_id:, amount:, status:)" in text
    assert "AnalyticsEvents(event_id:, customer_id:, kind:, occurred_at:)" in text
    # Same table name in two schemas does not collide.
    assert "AnalyticsCustomers(id:, segment:)" in text
    assert "ShopCustomers(id:" in text

    # The generated block is valid Logica that downstream rules can build on.
    program = text + "\nPaidOrders(id:) :- ShopOrders(id:, status: s), s == \"paid\";\n"
    assert synalog.check(program, engine="psql") == []


@pytest.mark.parametrize(
    "engine,dsn",
    [("trino", _trino_dsn()), ("presto", _presto_dsn())],
)
def test_introspect_trino_presto_reads_tpch(engine, dsn, runner_for):
    runner_for(engine)
    text = introspect(engine, dsn)

    # tpch ships the same 8 tables in each scale-factor schema (sf1, tiny, ...).
    assert "customer(custkey:, name:, address:, nationkey:" in text
    assert "Customer(custkey:, name:, address:, nationkey:" in text  # PascalCase head
    assert synalog.check(text, engine=engine) == []


def test_introspect_databricks_via_spark_show_fallback(runner_for):
    # Open-source Spark has no information_schema, so this exercises introspect's
    # SHOW SCHEMAS / SHOW TABLES / DESCRIBE TABLE fallback against a live server.
    runner = runner_for("databricks")
    schema = "synalog_introspect_test"
    runner.run(f"DROP SCHEMA IF EXISTS {schema} CASCADE")
    runner.run(f"CREATE SCHEMA {schema}")
    try:
        runner.run(f"CREATE TABLE {schema}.customers (id INT, full_name STRING)")
        runner.run(f"CREATE TABLE {schema}.orders (id INT, amount DOUBLE)")

        # Drive introspection through the Spark runner (the production path would
        # connect to real Databricks via databricks-sql-connector).
        text = introspect("databricks", fetch=runner.run)

        assert (
            "SynalogIntrospectTestCustomers(id:, full_name:)"
            f" :- {schema}.customers(id:, full_name:);" in text
        )
        assert (
            "SynalogIntrospectTestOrders(id:, amount:)"
            f" :- {schema}.orders(id:, amount:);" in text
        )
        # Everything introspected compiles as databricks-dialect Logica.
        assert synalog.check(text, engine="databricks") == []
    finally:
        runner.run(f"DROP SCHEMA IF EXISTS {schema} CASCADE")
