# The smallest string by a combine expression.
# Expect: rows T = [("ant",)]
V(s:) :- s in ["bee", "ant", "cat"];
T(m:) :- m == (combine Min= s :- V(s:));
