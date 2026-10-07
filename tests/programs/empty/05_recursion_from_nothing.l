# A recursion without base rows has no rows.
# Expect: rows R = []
E(a: 1, b: 2);
@Recursive(R, 5);
@OrderBy(R, "x");
R(x:) distinct :- x in [1], x > 5;
R(x: b) distinct :- R(x: a), E(a:, b:);
