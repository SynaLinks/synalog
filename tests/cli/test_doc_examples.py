"""The Synalog examples of the documentation, README and skill verify.

Examples are often excerpts: they reference tables and predicates defined
elsewhere, or show a fragment of a body. A fragment that does not parse is
skipped; an excerpt may leave predicates undefined. Anything else the
verifier reports is a mistake in the example, which an agent would copy.

Run with: python -m pytest tests/cli/test_doc_examples.py
"""

from __future__ import annotations

import re
from pathlib import Path

import pytest

import synalog

ROOT = Path(__file__).resolve().parents[2]
SOURCES = [ROOT / "README.md", *sorted((ROOT / "docs").rglob("*.md")), *sorted((ROOT / "skills").rglob("*.md"))]
BLOCK = re.compile(r"```synalog\n(.*?)```", re.S)

#: Errors that only say the excerpt leaves out what it refers to.
EXCERPT = (
    "Undefined predicate",
    "Undefined function",
    "Missing @OrderBy",
    "which the program does not define",
    "Imported file not found",
)


def examples():
    for path in SOURCES:
        for i, match in enumerate(BLOCK.finditer(path.read_text())):
            yield pytest.param(match.group(1), id=f"{path.relative_to(ROOT)}#{i}")


@pytest.mark.parametrize("source", examples())
def test_example_verifies(source: str):
    try:
        errors, _ = synalog.check(source, assertions=False)
    except ValueError:
        pytest.skip("a fragment, not a program")
    mistakes = [e for e in errors if not any(text in e for text in EXCERPT)]
    assert mistakes == []
