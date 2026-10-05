# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Synalog: logic programming for AI agents, compiling to optimized SQL."""

from importlib.metadata import PackageNotFoundError, version

from ._synalog import (
    SUPPORTED_ENGINES,
    assertions,
    builtin_functions,
    compile,
    compile_all,
    counterexamples,
    front_matter,
    parse,
    plan,
    quote_value,
    reserved_predicates,
    search,
    statement_text,
)
from .checking import check
from .execution import execute

try:
    __version__ = version("synalog")
except PackageNotFoundError:  # running from a source tree without install
    __version__ = "0.0.0+unknown"

__all__ = [
    "SUPPORTED_ENGINES",
    "assertions",
    "builtin_functions",
    "check",
    "compile",
    "compile_all",
    "counterexamples",
    "execute",
    "front_matter",
    "parse",
    "plan",
    "quote_value",
    "reserved_predicates",
    "search",
    "statement_text",
    "__version__",
]
