# The least boolean of a combine: false when some row matches.
# Expect: rows Q = [(1, False), (2, None)]
F(a: 1);
U(u: 1);
U(u: 2);
@OrderBy(Q, "u");
Q(u:, l: (combine Min= false :- F(a: u))) :- U(u:);
