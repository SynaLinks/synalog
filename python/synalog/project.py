# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""The project file, ``synalog.toml``: which database a project runs on.

A project is a folder of ``.l`` files with a ``synalog.toml`` at its root.
Its ``[connection]`` table names the engine and its connection details as
plain fields — no connection string to percent-encode — and is meant to be
committed, so everyone working on the project targets the same database::

    [connection]
    engine = "psql"
    host = "db.example.com"
    port = 5432
    database = "sales"
    user = "analyst"
    schema = "public"

Secrets never go in the file: each comes from the environment, usually the
project's git-ignored ``.env`` (which synalog loads), under
``SYNALOG_<ENGINE>_<FIELD>`` — ``SYNALOG_PSQL_PASSWORD``,
``SYNALOG_DATABRICKS_ACCESS_TOKEN`` — or, for BigQuery's service-account key,
the standard ``GOOGLE_APPLICATION_CREDENTIALS`` (a path to the key file).

``ENGINES`` is the one description of every remote engine's fields: the CLI
reads it, and applications (a connection form) can render it.
"""

from __future__ import annotations

import json
import os
import sys
from collections.abc import Mapping
from dataclasses import asdict, dataclass, field
from pathlib import Path
from urllib.parse import quote, urlencode

if sys.version_info >= (3, 11):
    import tomllib
else:  # pragma: no cover
    import tomli as tomllib

PROJECT_FILE = "synalog.toml"


class ProjectError(ValueError):
    """A ``synalog.toml`` that cannot be used, with what to fix."""


@dataclass(frozen=True)
class Field:
    key: str
    type: str = "text"  # text, number, select, password, file
    required: bool = False
    default: str | int | None = None
    secret: bool = False
    options: tuple[str, ...] = ()
    #: For a secret: the variable holding it, when not SYNALOG_<ENGINE>_<KEY>.
    env: str | None = None

    def as_dict(self) -> dict:
        d = {k: v for k, v in asdict(self).items() if v not in (None, False, ())}
        if self.options:
            d["options"] = list(self.options)
        return d


@dataclass(frozen=True)
class Engine:
    label: str
    fields: tuple[Field, ...] = field(default_factory=tuple)


_HTTP = Field("scheme", "select", default="http", options=("http", "https"))

#: Every remote engine: its connection details, in display order. Defaults
#: are real defaults — a missing port *is* 5432.
ENGINES: dict[str, Engine] = {
    "psql": Engine("PostgreSQL", (
        Field("host", required=True),
        Field("port", "number", required=True, default=5432),
        Field("database", required=True),
        Field("user", required=True),
        Field("password", "password", secret=True),
        Field("sslmode", "select", default="prefer",
              options=("disable", "allow", "prefer", "require", "verify-ca", "verify-full")),
        Field("schema", default="public"),
    )),
    "trino": Engine("Trino", (
        Field("host", required=True),
        Field("port", "number", required=True, default=8080),
        _HTTP,
        Field("catalog", required=True),
        Field("schema"),
        Field("user", required=True),
        Field("auth", "select", default="none", options=("none", "password", "jwt")),
        Field("password", "password", secret=True),
    )),
    "presto": Engine("Presto", (
        Field("host", required=True),
        Field("port", "number", required=True, default=8080),
        _HTTP,
        Field("catalog", required=True),
        Field("schema"),
        Field("user", required=True),
        Field("auth", "select", default="none", options=("none", "password")),
        Field("password", "password", secret=True),
    )),
    "databricks": Engine("Databricks", (
        Field("server_hostname", required=True),
        Field("http_path", required=True),
        Field("access_token", "password", required=True, secret=True),
        Field("catalog", required=True, default="main"),
        Field("schema"),
    )),
    "bigquery": Engine("BigQuery", (
        Field("project", required=True),
        Field("dataset", required=True),
        Field("credentials", "file", required=True, secret=True, env="GOOGLE_APPLICATION_CREDENTIALS"),
        Field("location"),
    )),
}


def secret_env(engine: str, key: str) -> str:
    """The environment variable holding a secret field."""
    spec = next((f for f in ENGINES[engine].fields if f.key == key), None)
    return (spec.env if spec and spec.env else None) or f"SYNALOG_{engine}_{key}".upper()


# -- finding and reading -------------------------------------------------------


def find(*starts: str | os.PathLike) -> Path | None:
    """The nearest ``synalog.toml``: in each start directory or one of its
    parents, the first start that has one winning."""
    for start in starts:
        for directory in (Path(start).resolve(), *Path(start).resolve().parents):
            if (directory / PROJECT_FILE).is_file():
                return directory / PROJECT_FILE
    return None


def connection(path: str | os.PathLike) -> dict | None:
    """The ``[connection]`` of a project file, checked: a known engine, known
    fields, required ones present, no secret written in the file. ``None``
    when the project has no connection (it runs on a local engine)."""
    path = Path(path)
    try:
        data = tomllib.loads(path.read_text(encoding="utf-8"))
    except tomllib.TOMLDecodeError as exc:
        raise ProjectError(f"{path}: {exc}") from None
    conn = data.get("connection")
    if conn is None:
        return None
    if not isinstance(conn, dict):
        raise ProjectError(f"{path}: [connection] must be a table")
    engine = conn.get("engine")
    if engine not in ENGINES:
        raise ProjectError(f"{path}: engine must be one of {', '.join(ENGINES)}, not {engine!r}")
    fields = {f.key: f for f in ENGINES[engine].fields}
    for key, value in conn.items():
        if key == "engine":
            continue
        if key not in fields:
            raise ProjectError(f"{path}: {engine} has no field {key!r} (fields: {', '.join(fields)})")
        if fields[key].secret:
            raise ProjectError(
                f"{path}: {key} is a secret — remove it from the file and set"
                f" {secret_env(engine, key)} in the project's .env (kept out of git)"
            )
    missing = [k for k, f in fields.items() if f.required and not f.secret and f.default is None and k not in conn]
    if missing:
        raise ProjectError(f"{path}: the {engine} connection needs {', '.join(missing)}")
    return conn


def details(conn: dict, env: Mapping[str, str] | None = None) -> dict:
    """A connection's fields with defaults filled in and secrets read from
    ``env`` (the process environment by default). Raises when a required
    secret is unset."""
    engine = conn["engine"]
    env = os.environ if env is None else env
    out = {}
    for f in ENGINES[engine].fields:
        if f.secret:
            value = env.get(secret_env(engine, f.key))
            if value is None and f.required:
                raise ProjectError(f"The {engine} connection needs {secret_env(engine, f.key)} (set it in the project's .env)")
        else:
            value = conn.get(f.key, f.default)
        if value not in (None, ""):
            out[f.key] = value
    return out


# -- connection strings --------------------------------------------------------


def dsn(engine: str, details: dict) -> str:
    """The connection string synalog's runner for ``engine`` parses."""
    c = {k: v for k, v in details.items() if v not in (None, "")}

    def userinfo(user, password) -> str:
        if not user:
            return ""
        return quote(str(user), safe="") + (f":{quote(str(password), safe='')}" if password else "") + "@"

    def hostport() -> str:
        return f"{c['host']}:{c['port']}" if c.get("port") else c["host"]

    if engine == "psql":
        query = {k: c[k] for k in ("sslmode",) if k in c}
        if c.get("schema"):
            query["options"] = f"-csearch_path={c['schema']}"
        suffix = f"?{urlencode(query)}" if query else ""
        return f"postgresql://{userinfo(c.get('user'), c.get('password'))}{hostport()}/{c.get('database', '')}{suffix}"
    if engine in ("trino", "presto"):
        path = "/".join(quote(str(c[k]), safe="") for k in ("catalog", "schema") if c.get(k))
        password = c.get("password") if c.get("auth") == "password" else None
        query = {"http_scheme": c["scheme"]} if c.get("scheme") else {}
        suffix = f"?{urlencode(query)}" if query else ""
        return f"{engine}://{userinfo(c.get('user'), password)}{hostport()}/{path}{suffix}"
    if engine == "databricks":
        query = {"http_path": c["http_path"], "access_token": c["access_token"]}
        return f"databricks://{c['server_hostname']}?{urlencode(query)}"
    if engine == "bigquery":
        query = {"location": c["location"]} if c.get("location") else {}
        return f"bigquery://{c['project']}" + (f"?{urlencode(query)}" if query else "")
    raise ProjectError(f"{engine!r} takes no connection")


def project_dsn(path: str | os.PathLike, engine: str, env: Mapping[str, str] | None = None) -> str | None:
    """The connection string of the project file at ``path`` for ``engine``,
    or ``None`` when the project connects to another engine, or none."""
    conn = connection(path)
    if conn is None or conn["engine"] != engine:
        return None
    return dsn(engine, details(conn, env))


# -- writing -------------------------------------------------------------------


def _toml_value(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    return json.dumps(str(value))  # a JSON string is a valid TOML basic string


def dumps(engine: str, details: dict) -> str:
    """The project file for a connection: its non-secret fields, in the
    engine's order (a field at its default is still written: the file says
    what the project connects to)."""
    if engine not in ENGINES:
        raise ProjectError(f"engine must be one of {', '.join(ENGINES)}, not {engine!r}")
    lines = ["[connection]", f"engine = {_toml_value(engine)}"]
    for f in ENGINES[engine].fields:
        value = details.get(f.key, f.default)
        if f.secret or value in (None, ""):
            continue
        if f.type == "number":
            value = int(value)
        lines.append(f"{f.key} = {_toml_value(value)}")
    return "\n".join(lines) + "\n"


def secrets(engine: str, details: dict) -> dict[str, str]:
    """The ``.env`` lines a connection needs: each secret given, by variable."""
    return {
        secret_env(engine, f.key): str(details[f.key])
        for f in ENGINES[engine].fields
        if f.secret and details.get(f.key) not in (None, "")
    }
