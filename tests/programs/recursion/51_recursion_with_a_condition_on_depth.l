# Counting up to a bound inside the rule.
# Expect: rows R = [(1,), (2,), (4,), (8,)]
@Recursive(R, 10);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: x * 2) distinct :- R(x:), x < 8;
