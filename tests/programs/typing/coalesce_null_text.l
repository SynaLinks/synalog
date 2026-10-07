# A null replaced by a text.
# Expect: rows Q = [('x',)]
A(v: null);
Q(v: Coalesce(v, "x")) :- A(v:);
