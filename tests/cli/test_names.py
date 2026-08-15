"""Unit tests for the exported name lists: reserved_predicates, builtin_functions.

These exist for embedders that resolve references themselves — a host storing
rules in a database cannot lean on `check` alone to catch a typo, so it needs
to know which names Synalog has already taken, and in which namespace. The
split matters: a name in call position is compiled to SQL, so treating
`Substr` as a relational reference reports a phantom missing table.

Run with: python -m pytest tests/cli/test_names.py
"""

from __future__ import annotations

import synalog


def test_reserved_predicates_holds_library_heads():
    reserved = synalog.reserved_predicates()
    for name in ("Today", "Now", "Num", "Str", "ArgMax"):
        assert name in reserved


def test_builtin_functions_holds_sql_builtins():
    functions = synalog.builtin_functions()
    for name in ("Substr", "ToString", "Like", "Upper", "Length"):
        assert name in functions


def test_namespaces_are_distinct():
    """`Substr` is a function, `Today` a predicate — never the reverse."""
    reserved = set(synalog.reserved_predicates())
    functions = set(synalog.builtin_functions())
    assert "Substr" not in reserved
    assert "Today" not in functions


def test_lists_are_sorted_and_stable():
    for names in (synalog.reserved_predicates(), synalog.builtin_functions()):
        assert names == sorted(names)
        assert len(names) == len(set(names))


def test_reserved_names_are_not_user_predicates():
    """What the lists are for: a reference to a built-in must not read as
    undefined, while a genuine typo still must."""
    program = "\n".join(
        [
            "Sale(id:, day:) :- sales(id:, created_at:),",
            "  day == Substr(ToString(created_at), 1, 10);",
            "Typo(id:) :- Saless(id:);",
        ]
    )
    errors = synalog.check(program)
    assert any("Saless" in e for e in errors)
    assert not any("Substr" in e or "ToString" in e for e in errors)
