# One variable in two columns requires them equal.
# Expect: rows Loop = [(2,)]
Edge(x: 1, y: 2);
Edge(x: 2, y: 2);
Loop(x:) :- Edge(x:, y: x);
