# Even and odd by mutual recursion.
# Expect: rows Even = [(0,), (2,), (4,)]
@Recursive(Even, 10);
@Recursive(Odd, 10);
@OrderBy(Even, "n");
Even(n: 0) distinct;
Even(n: m + 1) distinct :- Odd(n: m), m < 4;
Odd(n: m + 1) distinct :- Even(n: m), m < 4;
