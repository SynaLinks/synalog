# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""The project file, ``layer.toml``: which database a project runs on.

A project is a folder of ``.l`` files with a ``layer.toml`` at its root.
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

if sys.version_info >= (3, 11):
    import tomllib
else:  # pragma: no cover
    import tomli as tomllib

PROJECT_FILE = "layer.toml"


class ProjectError(ValueError):
    """A ``layer.toml`` that cannot be used, with what to fix."""


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
    """The nearest ``layer.toml``: in each start directory or one of its
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


# -- resolving ----------------------------------------------------------------


def resolve(*starts: str | os.PathLike) -> dict | None:
    """The connection of the project found from ``starts`` (see ``find``):
    its ``engine`` and every field a runner needs, defaults filled in and
    secrets read from the project's ``.env`` and the environment, real
    variables winning. The environment is not changed: two projects in one
    process each get their own secrets. ``None`` outside a project, or in
    one without a ``[connection]`` (it runs on a local engine)."""
    from .config import parse_dotenv

    path = find(*starts)
    if path is None:
        return None
    conn = connection(path)
    if conn is None:
        return None
    try:
        dotenv = dict(parse_dotenv((path.parent / ".env").read_text(encoding="utf-8")))
    except OSError:
        dotenv = {}
    return {"engine": conn["engine"], **details(conn, {**dotenv, **os.environ})}


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


# -- writing a project's connection ---------------------------------------------

#: Written next to layer.toml by `write`, never committed.
SECRET_FILES = (".env", "bigquery-credentials.json")
_KEY_FILE = "bigquery-credentials.json"


def _without_connection(text: str) -> str:
    """The project file's text without its ``[connection]`` table."""
    kept, skipping = [], False
    for line in text.splitlines(keepends=True):
        header = line.strip()
        if header.startswith("[") and header.endswith("]"):
            skipping = header == "[connection]"
        if not skipping:
            kept.append(line)
    return "".join(kept).rstrip("\n")


def _write_env(folder: Path, values: dict[str, str]) -> None:
    """Set ``values`` in the folder's ``.env``, keeping its other lines;
    owner-only. Values are quoted: ``parse_dotenv`` strips exactly one pair."""
    from .config import parse_dotenv

    path = folder / ".env"
    lines = path.read_text(encoding="utf-8").splitlines() if path.exists() else []
    keep = [line for line in lines if not any(k in values for k, _ in parse_dotenv(line))]
    path.write_text("".join(f"{line}\n" for line in [*keep, *(f'{k}="{v}"' for k, v in values.items())]), encoding="utf-8")
    os.chmod(path, 0o600)


def ensure_gitignore(folder: str | os.PathLike) -> None:
    """List the secret files in the folder's ``.gitignore``, keeping its other lines."""
    folder = Path(folder)
    path = folder / ".gitignore"
    lines = path.read_text(encoding="utf-8").splitlines() if path.exists() else []
    missing = [name for name in SECRET_FILES if name not in lines]
    if missing:
        path.write_text("".join(f"{line}\n" for line in [*lines, *missing]), encoding="utf-8")


def write(folder: str | os.PathLike, engine: str, details: dict) -> Path:
    """Give the project in ``folder`` a connection: its ``[connection]`` in
    ``layer.toml`` (the file's other tables are kept), its secrets in
    ``.env`` (other lines kept, owner-only), BigQuery's key — given as the
    key's JSON — in a key file next to it, and both listed in ``.gitignore``.
    Raises ``ProjectError`` for an unknown engine or field, or a missing
    required field. Returns the project file's path."""
    folder = Path(folder)
    if engine not in ENGINES:
        raise ProjectError(f"engine must be one of {', '.join(ENGINES)}, not {engine!r}")
    keys = {f.key for f in ENGINES[engine].fields}
    unknown = sorted(set(details) - keys)
    if unknown:
        raise ProjectError(f"{engine} has no field {', '.join(unknown)} (fields: {', '.join(sorted(keys))})")
    details = {k: v for k, v in details.items() if v not in (None, "")}
    # Checked before anything is written: a failed connect leaves the project as it was.
    missing = [f.key for f in ENGINES[engine].fields if f.required and not f.secret and f.default is None and f.key not in details]
    if missing:
        raise ProjectError(f"the {engine} connection needs {', '.join(missing)}")
    folder.mkdir(parents=True, exist_ok=True)
    secrets_ = {}
    if isinstance(details.get("credentials"), dict):  # BigQuery's key, as JSON
        key = folder / _KEY_FILE
        key.write_text(json.dumps(details.pop("credentials"), indent=2) + "\n", encoding="utf-8")
        os.chmod(key, 0o600)
        secrets_[secret_env(engine, "credentials")] = str(key.resolve())
    secrets_.update(secrets(engine, details))
    path = folder / PROJECT_FILE
    others = _without_connection(path.read_text(encoding="utf-8")) if path.exists() else ""
    path.write_text((others + "\n\n" if others else "") + dumps(engine, details), encoding="utf-8")
    connection(path)  # every required field given
    if secrets_:
        _write_env(folder, secrets_)
    ensure_gitignore(folder)
    return path


def clear(folder: str | os.PathLike) -> None:
    """Remove the project's connection — back to an in-memory engine: the
    ``[connection]`` table (other tables kept) and the secret files."""
    folder = Path(folder)
    path = folder / PROJECT_FILE
    if path.exists():
        path.write_text(_without_connection(path.read_text(encoding="utf-8")) + "\n", encoding="utf-8")
    for name in SECRET_FILES:
        (folder / name).unlink(missing_ok=True)
