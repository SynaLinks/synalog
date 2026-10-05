# The step at which each node is first reached.
# Expect: rows S = [(1, 0), (2, 1), (3, 2)]
E(a: 1, b: 2);
E(a: 2, b: 3);
@Recursive(S, 5);
@OrderBy(S, "x");
S(x: 1, s? Min= 0) distinct;
S(x: b, s? Min= s + 1) distinct :- S(x: a, s:), E(a:, b:);
