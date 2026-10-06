# Test: Records with a null field do not meet on it. (from tests/programs/joins3/null_record_field_join.l)

A(r: {k: null});
B(r: {k: null});
Q(x: 1) :- A(r: a), B(r: b), a.k == b.k;
