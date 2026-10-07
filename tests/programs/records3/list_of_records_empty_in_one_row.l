# A list of records, empty in one row.
# Expect: rows Q = [(1, 1), (2, 0)]
T(k: 1, l: [{n: "a"}]);
T(k: 2, l: []);
@OrderBy(Q, "k");
Q(k:, s: Size(l)) :- T(k:, l:);
