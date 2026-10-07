# Test: A null replaced by a number. (from tests/programs/typing/coalesce_null_number.l)

A(v: null);
Q(v: Coalesce(v, 5)) :- A(v:);
