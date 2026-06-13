# Math utility predicates for import testing

# Double a number
Double(x, result) :- result == x * 2;

# Square a number
Square(x, result) :- result == x * x;

# Sum two numbers
Add(a, b, result) :- result == a + b;

# Check if positive
IsPositive(x) :- x > 0;
