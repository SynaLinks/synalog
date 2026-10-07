# A list of records of records.
# Expect: rows Q = [("x", 1), ("y", 2)]
R(l: [{p: {n: "x", v: 1}}, {p: {n: "y", v: 2}}]);
@OrderBy(Q, "n");
Q(n: e.p.n, v: e.p.v) :- R(l:), e in l;
