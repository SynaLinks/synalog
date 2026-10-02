# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Synalog: logic programming for AI agents, compiling to optimized SQL."""

from importlib.metadata import PackageNotFoundError, version

from ._synalog import (
    SUPPORTED_ENGINES,
    builtin_functions,
    check,
    compile,
    compile_all,
    front_matter,
    parse,
    reserved_predicates,
    search,
)

try:
    __version__ = version("synalog")
except PackageNotFoundError:  # running from a source tree without install
    __version__ = "0.0.0+unknown"

__all__ = [
    "SUPPORTED_ENGINES",
    "builtin_functions",
    "check",
    "compile",
    "compile_all",
    "front_matter",
    "parse",
    "reserved_predicates",
    "search",
    "__version__",
]
