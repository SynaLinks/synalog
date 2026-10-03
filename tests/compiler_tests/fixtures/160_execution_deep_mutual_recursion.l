# Test: Mutual recursion past 20 steps. (from tests/programs/execution/77_deep_mutual_recursion.l)

@Recursive(Even, 24);
@Recursive(Odd, 24);
Even(n: 0) distinct;
Even(n: m + 1) distinct :- Odd(n: m), m < 22;
Odd(n: m + 1) distinct :- Even(n: m), m < 22;
Top(t? Max= n) distinct :- Even(n:) | Odd(n:);
