# Test: Multiple predicates with dependencies

# Base data
Numbers(x) :- x in Range(10);

# Predicate chain
Even(x) :- Numbers(x), x % 2 == 0;
Odd(x) :- Numbers(x), x % 2 == 1;

# Derived predicates
EvenSquare(x:, sq: x * x) :- Even(x);
OddSquare(x:, sq: x * x) :- Odd(x);

# Combining predicates
AllSquares(x:, sq:, type: "even") :- EvenSquare(x:, sq:);
AllSquares(x:, sq:, type: "odd") :- OddSquare(x:, sq:);

# Predicate with multiple body predicates
Combined(x:, y:) :- Even(x), Odd(y), x < y;

@OrderBy(Test, "x");
Test(x:, sq:, type:) :- AllSquares(x:, sq:, type:);
