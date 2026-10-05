# Test: A record with a null field. (from tests/programs/records/13_record_with_a_string_and_null.l)

V(r: {s: "a", n: null});
R(s: r.s, n: r.n) :- V(r:);
