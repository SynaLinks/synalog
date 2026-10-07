# A list of records of records, unnested.
# Expect: rows Q = [("p", 1), ("q", 2)]
R(l: [{a: {n: "p", v: 1}}, {a: {n: "q", v: 2}}]);
@OrderBy(Q, "n");
Q(n: e.a.n, v: e.a.v) :- R(l:), e in l;
