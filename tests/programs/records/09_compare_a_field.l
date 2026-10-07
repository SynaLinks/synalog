# Filtering on a record field.
# Expect: rows R = [("b",)]
V(r: {k: 1, s: "a"});
V(r: {k: 2, s: "b"});
R(s: r.s) :- V(r:), r.k > 1;
