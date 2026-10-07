# Test: A value from the fields of {s: "x"}. (from tests/programs/rgrid2/record_02.l)

V(r: {s: "x"});
R(v: r.s ++ "y") :- V(r:);
