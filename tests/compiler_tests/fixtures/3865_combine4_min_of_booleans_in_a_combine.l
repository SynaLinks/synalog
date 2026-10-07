# Test: The least boolean of a combine: false when some row matches. (from tests/programs/combine4/min_of_booleans_in_a_combine.l)

F(a: 1);
U(u: 1);
U(u: 2);
@OrderBy(Q, "u");
Q(u:, l: (combine Min= false :- F(a: u))) :- U(u:);
