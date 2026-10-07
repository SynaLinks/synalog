# Test: A null replaced by a text. (from tests/programs/typing/coalesce_null_text.l)

A(v: null);
Q(v: Coalesce(v, "x")) :- A(v:);
