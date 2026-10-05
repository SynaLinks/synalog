# Test: Filtering on a record field. (from tests/programs/records/09_compare_a_field.l)

V(r: {k: 1, s: "a"});
V(r: {k: 2, s: "b"});
R(s: r.s) :- V(r:), r.k > 1;
