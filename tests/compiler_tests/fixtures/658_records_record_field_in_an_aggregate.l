# Test: Summing a record field. (from tests/programs/records/15_record_field_in_an_aggregate.l)

V(r: {a: 2});
V(r: {a: 3});
R(t? += r.a) distinct :- V(r:);
