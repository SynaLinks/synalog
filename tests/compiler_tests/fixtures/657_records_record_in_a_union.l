# Test: Records from two rules. (from tests/programs/records/14_record_in_a_union.l)

V(r: {a: 1});
V(r: {a: 2});
@OrderBy(R, "a");
R(a: r.a) :- V(r:);
