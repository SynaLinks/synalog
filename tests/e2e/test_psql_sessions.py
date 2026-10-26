"""PostgreSQL sessions as `synalog.execute` opens them (`PsqlSession`): two
plans running at once, a source changing while a plan runs, a session that
may only read."""

from __future__ import annotations

import os
import threading
import uuid
from urllib.parse import urlparse

import pytest

from conftest import selected_engines

pytestmark = pytest.mark.skipif(
    bool(selected_engines()) and "psql" not in selected_engines(), reason="psql not selected"
)


def _connection(user=None, password=None) -> dict:
    dsn = urlparse(
        os.environ.get(
            "SYNALOG_E2E_PSQL_DSN",
            "postgresql://synalog:synalog@localhost:{}/synalog".format(os.environ.get("SYNALOG_E2E_PSQL_PORT", "5433")),
        )
    )
    return {
        "host": dsn.hostname,
        "port": dsn.port or 5432,
        "database": dsn.path.lstrip("/"),
        "user": user or dsn.username,
        "password": password if user else dsn.password,
        "schema": "public",
    }


@pytest.fixture
def admin(runner_for):
    import psycopg

    runner_for("psql")  # skips when the server is unavailable
    c = _connection()
    conn = psycopg.connect(
        host=c["host"], port=c["port"], dbname=c["database"], user=c["user"], password=c["password"], autocommit=True
    )
    yield conn
    conn.close()


def test_concurrent_plans_do_not_share_grounded_tables(admin):
    """Two runs grounding the same predicate each read their own table, and
    neither's cleanup drops the other's."""
    import synalog
    from synalog.runners import PsqlSession, run_plan

    sources = {
        "A": "@Ground(Q); Q(x: 1); R(x:) :- Q(x:);",
        "B": "@Ground(Q); Q(x: 2); R(x:) :- Q(x:);",
    }
    ready = {name: threading.Event() for name in sources}
    release = {name: threading.Event() for name in sources}
    answers = {}

    class PausingSession(PsqlSession):
        """Waits before the final SELECT: the runs interleave."""

        def __init__(self, name):
            self.name = name
            super().__init__(_connection())

        def run(self, script):
            if script.lstrip().startswith("SELECT") and ".Q AS Q" in script:
                ready[self.name].set()
                if not release[self.name].wait(30):
                    raise RuntimeError("coordination timed out")
            return super().run(script)

    def query(name):
        try:
            with PausingSession(name) as s:
                answers[name] = run_plan(synalog.plan(sources[name], "R", engine="psql"), s)[1]
        except Exception as e:  # noqa: BLE001 - reported by the assertion
            answers[name] = e

    threads = {name: threading.Thread(target=query, args=(name,)) for name in sources}
    threads["A"].start()
    assert ready["A"].wait(30), answers
    threads["B"].start()
    assert ready["B"].wait(30), answers
    release["A"].set()
    threads["A"].join(30)
    release["B"].set()
    threads["B"].join(30)
    assert answers == {"A": [(1,)], "B": [(2,)]}


def test_plan_reads_one_snapshot(admin):
    """A source updated between the steps of a plan is read in one version."""
    import synalog
    from synalog.runners import PsqlSession, run_plan

    table = f"snapshot_source_{uuid.uuid4().hex[:8]}"
    admin.execute(f"CREATE TABLE {table} (x integer)")
    try:
        admin.execute(f"INSERT INTO {table} VALUES (1)")
        source = (
            f"@Ground(Q); Source(x:) :- {table}(x:); Q(x:) :- Source(x:);"
            " R(old: x, new: y) :- Q(x:), Source(x: y);"
        )

        class UpdatingSession(PsqlSession):
            """Another session updates the source before the final SELECT."""

            def run(self, script):
                if script.lstrip().startswith("SELECT") and "AS old" in script:
                    admin.execute(f"UPDATE {table} SET x = 2")
                return super().run(script)

        with UpdatingSession(_connection()) as s:
            assert run_plan(synalog.plan(source, "R", engine="psql"), s)[1] == [(1, 1)]
    finally:
        admin.execute(f"DROP TABLE {table}")


def test_read_only_session_runs_a_query(admin):
    """A role whose transactions are read-only runs a query that writes no
    table, on a database Synalog never set up: the session's setup writes
    nothing it must."""
    import synalog
    from synalog.runners import PsqlSession, run_plan

    suffix = uuid.uuid4().hex[:8]
    role, database = f"synalog_reader_{suffix}", f"synalog_read_only_{suffix}"
    admin.execute(f"CREATE ROLE {role} LOGIN PASSWORD 'reader'")
    admin.execute(f"CREATE DATABASE {database}")
    try:
        admin.execute(f"ALTER ROLE {role} SET default_transaction_read_only = on")
        steps = synalog.plan("Q(x: 1);", "Q", engine="psql")
        with PsqlSession(_connection(role, "reader") | {"database": database}) as s:
            assert run_plan(steps, s)[1] == [(1,)]
    finally:
        admin.execute(f"DROP DATABASE {database}")
        admin.execute(f"DROP ROLE {role}")
