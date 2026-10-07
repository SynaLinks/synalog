# Test: The smallest string by a combine expression. (from tests/programs/combine/08_min_of_strings.l)

V(s:) :- s in ["bee", "ant", "cat"];
T(m:) :- m == (combine Min= s :- V(s:));
