# Test: past 20 steps, recursion iterates tables; the script repeats the iteration

Next(x:, y: x + 1) :- x in Range(100);

@Recursive(Test, 30);
Test(y: 0) distinct;
Test(y:) distinct :- Test(y: x), Next(x:, y:);
