# Mutual recursion past 20 steps.
# Expect: rows Top = [(30,)]
@Recursive(Even, 40);
@Recursive(Odd, 40);
Even(n: 0) distinct;
Even(n: m + 1) distinct :- Odd(n: m), m < 30;
Odd(n: m + 1) distinct :- Even(n: m), m < 30;
Top(t? Max= n) distinct :- Even(n:) | Odd(n:);
