# Test: mutual recursion past 20 steps; each table runs after what it reads

@Recursive(Even, 25);
@Recursive(Odd, 25);
Even(n: 0) distinct;
Even(n: m + 1) distinct :- Odd(n: m), m < 100;
Odd(n: m + 1) distinct :- Even(n: m), m < 100;

Test(t? Max= n) distinct :- Even(n:) | Odd(n:);
