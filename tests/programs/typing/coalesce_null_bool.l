# A null replaced by a bool.
# Expect: rows Q = [(True,)]
A(v: null);
Q(v: Coalesce(v, true)) :- A(v:);
