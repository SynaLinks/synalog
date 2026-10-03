# A value function: its argument is an input.
# Expect: rows Out = [(1, 2), (2, 3)]
Inc(x) = n :- n == x + 1;
V(x:) :- x in [1, 2];
@OrderBy(Out, "x");
Out(x:, y:) :- V(x:), y == Inc(x);
