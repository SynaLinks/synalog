# Test: A null replaced by a bool. (from tests/programs/typing/coalesce_null_bool.l)

A(v: null);
Q(v: Coalesce(v, true)) :- A(v:);
