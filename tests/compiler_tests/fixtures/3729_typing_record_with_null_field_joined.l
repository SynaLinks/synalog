# Test: A record with a null field, the field compared after a join. (from tests/programs/typing/record_with_null_field_joined.l)

A(k: 1, r: {v: null});
A(k: 2, r: {v: 3});
B(k: 1);
B(k: 2);
Q(k:) :- A(k:, r:), B(k:), r.v is null;
