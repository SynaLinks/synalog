# A combine expression with a filter in its body.
# Expect: rows T = [(5,)]
V(x:) :- x in [1, 2, 3];
T(t:) :- t == (combine += x :- V(x:), x > 1);
