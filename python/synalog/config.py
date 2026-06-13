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
