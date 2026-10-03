# A negation over a column named select.
# Expect: rows Out = [(2,)]
V(select:) :- select in [1, 2];
Banned(select: 1);
Out(select:) :- V(select:), ~Banned(select:);
