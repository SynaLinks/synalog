# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""The ``.env`` file: a project's secrets, loaded into the environment.

A connection is described only by the project's ``synalog.toml`` (see
``synalog.project``); its secrets — a password, a token — come from the
environment, usually from the git-ignored ``.env`` next to it.
"""

from __future__ import annotations

import os
from pathlib import Path


def parse_dotenv(text: str) -> list[tuple[str, str]]:
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
        for key, value in parse_dotenv(text):
            os.environ.setdefault(key, value)
