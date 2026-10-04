# Mutual recursion stops at the declared depth, which bounds both predicates.
# Expect: rows Even = [(0,), (2,), (4,)]
@Recursive(Even, 5);
@Recursive(Odd, 5);
@OrderBy(Even, "x");
Even(x: 0) distinct;
Even(x: y + 1) distinct :- Odd(x: y);
Odd(x: y + 1) distinct :- Even(x: y);
