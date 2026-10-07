# A null replaced by a number.
# Expect: rows Q = [(5,)]
A(v: null);
Q(v: Coalesce(v, 5)) :- A(v:);
