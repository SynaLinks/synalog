# Test: Mutual recursion until it converges. (from tests/programs/recursion/44_mutual_until_convergence.l)

@Recursive(Odd, -1);
Odd(x: y + 1) distinct :- Even(x: y), y < 4;
@Recursive(Even, -1);
@OrderBy(Even, "x");
Even(x: 0) distinct;
Even(x: y + 1) distinct :- Odd(x: y), y < 4;
