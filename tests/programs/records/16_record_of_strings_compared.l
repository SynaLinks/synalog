# Filtering on a string field.
# Expect: rows R = [("y",)]
V(r: {k: "a", v: "x"});
V(r: {k: "b", v: "y"});
R(v: r.v) :- V(r:), r.k == "b";
