# Test: List comprehensions
@Engine("duckdb");

# Simple list comprehension using Array aggregation
Squares() Array= x -> x * x :- x in Range(5);

# List comprehension with filter
EvenSquares() Array= x -> x * x :- x in Range(10), x % 2 == 0;

Test(squares: Squares(), even_squares: EvenSquares());
