# Test: Reading a field of a record. (from tests/programs/records/01_field_access.l)

R(r: {a: 1, b: 2});
X(a:) :- R(r:), a == r.a;
