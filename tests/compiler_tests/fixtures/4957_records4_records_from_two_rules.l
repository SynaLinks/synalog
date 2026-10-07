# Test: Records from two rules, one with a null field. (from tests/programs/records4/records_from_two_rules.l)

R(k: 1, r: {a: "x", l: [1]});
R(k: 2, r: {a: null, l: []});
@OrderBy(Q, "k");
Q(k:, a: r.a, n: Size(r.l)) :- R(k:, r:);
