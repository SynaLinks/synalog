# A recursion with two base rules.
# Expect: rows R = [(1,), (2,), (10,), (11,)]
@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: 10) distinct;
R(x: x + 1) distinct :- R(x:), x % 10 == 0 || x == 1;
