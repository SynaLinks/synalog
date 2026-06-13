# Test: Negation

Number(x) :- x in Range(10);
Even(x) :- Number(x), x % 2 == 0;
Prime(2);
Prime(3);
Prime(5);
Prime(7);

# Simple negation
Odd(x) :- Number(x), ~Even(x);

# Negation with multiple conditions
NotPrime(x) :- Number(x), x > 1, ~Prime(x);

# Composite negation
EvenNotPrime(x) :- Even(x), ~Prime(x);

@OrderBy(Test, "test_name", "x");
Test(test_name: "odd", x:) :- Odd(x);
Test(test_name: "not_prime", x:) :- NotPrime(x);
Test(test_name: "even_not_prime", x:) :- EvenNotPrime(x);
