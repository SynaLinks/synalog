# Test: A field of a nested record. (from tests/programs/records/07_nested_field.l)

V(r: {a: {b: 5}});
R(v: r.a.b) :- V(r:);
