# A fact whose only list is empty.
# Expect: rows Q = [(0,)]
F(l: []);
Q(n: Size(l)) :- F(l:);
