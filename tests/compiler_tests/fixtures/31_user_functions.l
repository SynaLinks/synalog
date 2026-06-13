# Test: User-defined functions

# Simple function
Square(x) = x * x;

# Function with multiple args
Add(a, b) = a + b;

# Function calling function
SumOfSquares(a, b) = Square(a) + Square(b);

# String function
FullName(first, last) = first ++ " " ++ last;

# Conditional function
Sign(x) = if x > 0 then 1 else if x < 0 then -1 else 0;

# Using functions in rules
Numbers(x) :- x in Range(5);

Squared(x, sq) :- Numbers(x), sq == Square(x);

Added(x, y, sum) :-
  Numbers(x), Numbers(y),
  x < y,
  sum == Add(x, y);

@OrderBy(Test, "x");
Test(x:, sq:) :- Squared(x, sq);
