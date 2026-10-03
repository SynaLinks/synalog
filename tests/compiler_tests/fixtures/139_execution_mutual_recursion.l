# Test: Even and odd by mutual recursion. (from tests/programs/execution/56_mutual_recursion.l)

@Recursive(Odd, 10);
Odd(n: m + 1) distinct :- Even(n: m), m < 4;
@Recursive(Even, 10);
@OrderBy(Even, "n");
Even(n: 0) distinct;
Even(n: m + 1) distinct :- Odd(n: m), m < 4;
