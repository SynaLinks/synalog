# Summing a column of integers and doubles.
# Expect: rows Q = [(4.5,)]
U(v: 2);
U(v: 2.5);
Q(s? += v) distinct :- U(v:);
