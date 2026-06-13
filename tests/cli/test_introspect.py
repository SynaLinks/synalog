"""Unit tests for synalog.introspect: catalog SQL and predicate formatting.

The pure formatting and SQL-building logic is exercised here without a database
driver or a live server. The generated predicates are round-tripped through the
real compiler to prove they are valid, usable Logica.

Run with: python -m pytest tests/cli/test_introspect.py
"""

from __future__ import annotations

import pytest

from synalog import introspect
from synalog._synalog import check
from synalog.introspect import INTROSPECTABLE, _introspect_sql, predicates


def test_predicates_basic_shape():
    rows = [
        ("public", "users", "id"),
        ("public", "users", "email"),
        ("public", "orders", "id"),
        ("public", "orders", "amount"),
    ]
    text = predicates("psql", rows)
    assert "PublicUsers(id:, email:) :- public.users(id:, email:);" in text
    assert "PublicOrders(id:, amount:) :- public.orders(id:, amount:);" in text
    assert text.startswith("# Tables")


def test_predicates_are_valid_logica():
    rows = [("public", "users", "id"), ("public", "users", "name")]
    prog = predicates("psql", rows) + "\nDemo(id:) :- PublicUsers(id:);\n"
    assert check(prog, engine="psql") == []


def test_predicates_qualify_by_schema():
    # Same table name in two schemas must not collide.
    rows = [("public", "t", "a"), ("staging", "t", "a")]
    text = predicates("psql", rows)
    assert "PublicT(a:) :- public.t(a:);" in text
    assert "StagingT(a:) :- staging.t(a:);" in text


def test_predicates_capitalized_column_uses_explicit_mapping():
    # Capitalized columns can't use shorthand (parser forbids capital fields);
    # they map to a safe lowercase variable instead, and still compile.
    rows = [("public", "t", "UserId")]
    text = predicates("psql", rows)
    assert "PublicT(UserId: userid) :- public.t(UserId: userid);" in text
    assert check(text, engine="psql") == []


def test_predicates_skip_unquotable_columns_with_comment():
    rows = [("public", "t", "id"), ("public", "t", "created at")]
    text = predicates("psql", rows)
    assert "PublicT(id:) :- public.t(id:);" in text
    assert "skipped column(s) needing quoting: created at" in text


def test_predicates_omit_table_with_no_representable_columns():
    rows = [("public", "weird", "a b"), ("public", "weird", "c d")]
    text = predicates("psql", rows)
    assert "no representable columns, omitted" in text
    assert "PublicWeird(" not in text


def test_predicate_name_collision_is_suffixed():
    # public.user_roles and public.userRoles both pascal-case to PublicUserRoles.
    rows = [("public", "user_roles", "a"), ("public", "userRoles", "a")]
    text = predicates("psql", rows)
    assert "PublicUserRoles(a:)" in text
    assert "PublicUserRoles2(a:)" in text


@pytest.mark.parametrize("engine", ["psql", "trino", "presto", "databricks"])
def test_info_schema_sql_shape(engine):
    sql = _introspect_sql(engine, None)
    assert "information_schema.columns" in sql
    assert "table_schema, table_name, column_name" in sql
    assert "ORDER BY table_schema, table_name, ordinal_position" in sql


def test_bigquery_sql_uses_region_from_dsn_location():
    default = _introspect_sql("bigquery", None)
    assert "`region-us`.INFORMATION_SCHEMA.COLUMNS" in default
    eu = _introspect_sql("bigquery", "bigquery://my-proj?location=EU")
    assert "`region-eu`.INFORMATION_SCHEMA.COLUMNS" in eu


def test_databricks_prefers_information_schema_when_available():
    # Unity Catalog: a single information_schema query, no SHOW/DESCRIBE.
    seen = []

    def fetch(sql):
        seen.append(sql)
        return [("public", "t", "a"), ("public", "t", "b")]

    text = introspect.introspect("databricks", fetch=fetch)
    assert "PublicT(a:, b:) :- public.t(a:, b:);" in text
    assert seen == [_introspect_sql("databricks", None)]  # exactly one query


def test_databricks_falls_back_to_show_without_information_schema():
    def fetch(sql):
        if "information_schema" in sql:
            raise RuntimeError("Table or view not found")
        if sql == "SHOW SCHEMAS":
            return [("default",), ("shop",), ("information_schema",)]
        if sql.startswith("SHOW TABLES IN `shop`"):
            return [("shop", "customers", False), ("shop", "orders", False)]
        if sql.startswith("SHOW TABLES IN `default`"):
            return []
        if "customers" in sql:  # DESCRIBE TABLE, with a partition-info trailer
            return [
                ("id", "int", None),
                ("full_name", "string", None),
                ("", "", ""),
                ("# Partition Information", "", ""),
                ("# col_name", "data_type", "comment"),
            ]
        return [("id", "int", None), ("amount", "double", None)]  # orders

    text = introspect.introspect("databricks", fetch=fetch)
    assert "ShopCustomers(id:, full_name:) :- shop.customers(id:, full_name:);" in text
    assert "ShopOrders(id:, amount:) :- shop.orders(id:, amount:);" in text
    assert "information_schema" not in text  # system schema excluded
    assert check(text, engine="databricks") == []


def test_introspect_rejects_unknown_engine():
    with pytest.raises(introspect.RunnerUnavailable, match="cannot be introspected"):
        introspect.introspect("sqlite")


def test_introspect_requires_dsn(monkeypatch, tmp_path):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    monkeypatch.delenv("SYNALOG_PSQL_DSN", raising=False)
    with pytest.raises(introspect.RunnerUnavailable, match="needs a connection string"):
        introspect.introspect("psql")


def test_introspectable_matches_connectable_engines():
    # introspect should cover exactly the engines `synalog connect` accepts.
    from synalog.cli import DSN_ENGINES

    assert set(INTROSPECTABLE) == set(DSN_ENGINES)
