"""The e2e suite's guard: a session that runs no statement writing outside
`synalog_home` (`synalog.writes`), the only guard on Spark, which has no
access control. The suite also runs every plan through a user that may write
nowhere else (see `runners.py`).

`Audited` wraps a session: every statement it runs is read first, synalog's
own cleanup of its tables included.
"""

from __future__ import annotations

from synalog.writes import HOME, writes_outside_home


class WriteOutsideHome(AssertionError):
    pass


class Audited:
    """A session that refuses to run a statement writing outside `synalog_home`."""

    def __init__(self, session, engine: str):
        self._session = session
        self._engine = engine

    def run(self, script: str):
        outside = writes_outside_home(script, self._engine)
        if outside:
            raise WriteOutsideHome(f"{self._engine}: writes outside {HOME}: {outside}\n{script}")
        return self._session.run(script)

    def __getattr__(self, name):
        return getattr(self._session, name)
