# Mutual recursion until it converges.
# Expect: rows Even = [(0,), (2,), (4,)]
@Recursive(Even, -1);
@Recursive(Odd, -1);
@OrderBy(Even, "x");
Even(x: 0) distinct;
Even(x: y + 1) distinct :- Odd(x: y), y < 4;
Odd(x: y + 1) distinct :- Even(x: y), y < 4;
