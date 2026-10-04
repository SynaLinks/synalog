# Joining on a field of a record.
# Expect: rows J = [("x",)]
R(r: {id: 1});
S(id: 1, v: "x");
J(v:) :- R(r:), S(id: r.id, v:);
