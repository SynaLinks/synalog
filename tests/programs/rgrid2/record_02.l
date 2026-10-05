# A value from the fields of {s: "x"}.
# Expect: rows R = [("xy",)]
V(r: {s: "x"});
R(v: r.s ++ "y") :- V(r:);
