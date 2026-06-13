# Test: Arithmetic operations
@Engine("duckdb");

# Basic arithmetic
Numbers(x) :- x in Range(10);

# All arithmetic operations
Arithmetic(x:,
           add: x + 5,
           sub: x - 3,
           mul: x * 2,
           div_val: x / 2,
           mod_val: x % 3,
           pow_val: x ^ 2,
           neg_val: -x) :- Numbers(x), x > 0;

# Combined expressions
Combined(x:, result: (x + 1) * 2 - x / 2) :- Numbers(x), x > 0;

@OrderBy(Test, "x");
Test(x:, add:, sub:, mul:) :- Arithmetic(x:, add:, sub:, mul:, div_val:, mod_val:, pow_val:, neg_val:);
