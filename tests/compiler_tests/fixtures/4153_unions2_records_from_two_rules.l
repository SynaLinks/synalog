# Test: Records from two rules. (from tests/programs/unions2/records_from_two_rules.l)

R(k: 1, r: {n: "a", l: []});
R(k: 2, r: {n: "b", l: [7, 8]});
@OrderBy(Q, "k");
Q(k:, n: r.n, c: Size(r.l)) :- R(k:, r:);
