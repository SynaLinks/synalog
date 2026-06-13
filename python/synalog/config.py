# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Saved connections for remote engines (`synalog connect`).

Connection strings are stored per engine in a JSON file under the user
config directory (override with SYNALOG_CONFIG_DIR):

  Linux/macOS:  ~/.config/synalog/connections.json  (honors XDG_CONFIG_HOME)
  Windows:      %APPDATA%/synalog/connections.json

The file may contain credentials, so it is created with 0600 permissions.
Resolution order for a connection string is: the --dsn flag, then the
SYNALOG_<ENGINE>_DSN environment variable, then this file.
"""

from __future__ import annotations

import json
import os
from pathlib import Path


def _parse_dotenv(text: str) -> list[tuple[str, str]]:
    """Parse a .env file's ``KEY=VALUE`` lines into pairs.

    Blank lines and ``#`` comments are ignored; a leading ``export`` is allowed;
    surrounding single/double quotes on the value are stripped. Lines without an
    ``=`` or with a non-identifier key are skipped rather than erroring.
    """
    pairs: list[tuple[str, str]] = []
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("export "):
            line = line[len("export "):].lstrip()
        key, sep, value = line.partition("=")
        key = key.strip()
        if not sep or not key.isidentifier():
            continue
        value = value.strip()
        if len(value) >= 2 and value[0] == value[-1] and value[0] in ("'", '"'):
            value = value[1:-1]
        pairs.append((key, value))
    return pairs


def load_dotenv(*directories: str | os.PathLike) -> None:
    """Load ``.env`` files from ``directories`` into the process environment.

    Variables already set in the environment win (a real ``export`` or the
    parent shell beats the file), and earlier directories win over later ones.
    Missing or unreadable files are skipped silently — a ``.env`` is optional.
    """
    for directory in directories:
        try:
            text = (Path(directory) / ".env").read_text(encoding="utf-8")
        except OSError:
            continue
        for key, value in _parse_dotenv(text):
            os.environ.setdefault(key, value)


def config_dir() -> Path:
    if explicit := os.environ.get("SYNALOG_CONFIG_DIR"):
        return Path(explicit)
    if os.name == "nt":
        base = os.environ.get("APPDATA") or str(Path.home())
        return Path(base) / "synalog"
    base = os.environ.get("XDG_CONFIG_HOME") or str(Path.home() / ".config")
    return Path(base) / "synalog"


def _connections_file() -> Path:
    return config_dir() / "connections.json"


def load_connections() -> dict[str, str]:
    try:
        with open(_connections_file(), encoding="utf-8") as f:
            data = json.load(f)
    except (OSError, ValueError):
        return {}
    return {k: v for k, v in data.items() if isinstance(v, str)}


def saved_connection(engine: str) -> str | None:
    return load_connections().get(engine)


def _write(connections: dict[str, str]) -> None:
    path = _connections_file()
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(connections, indent=2) + "\n", encoding="utf-8")
    try:
        os.chmod(path, 0o600)
    except OSError:
        pass  # best effort (e.g. unsupported filesystem)


def save_connection(engine: str, dsn: str) -> None:
    connections = load_connections()
    connections[engine] = dsn
    _write(connections)


def remove_connection(engine: str) -> bool:
    connections = load_connections()
    if engine not in connections:
        return False
    del connections[engine]
    _write(connections)
    return True
