# A combine over no rows is null.
# Expect: rows T = [(None,)]
V(x:) :- x in [1], x > 5;
T(t:) :- t == (combine += x :- V(x:));
