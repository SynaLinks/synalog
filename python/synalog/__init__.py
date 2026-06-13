"""Synalog: logic programming for AI agents, compiling to optimized SQL."""

from importlib.metadata import PackageNotFoundError, version

from ._synalog import SUPPORTED_ENGINES, check, compile, compile_all, parse

try:
    __version__ = version("synalog")
except PackageNotFoundError:  # running from a source tree without install
    __version__ = "0.0.0+unknown"

__all__ = [
    "SUPPORTED_ENGINES",
    "check",
    "compile",
    "compile_all",
    "parse",
    "__version__",
]
