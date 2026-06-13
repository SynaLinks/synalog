# Test: Import and extend with local rules
@Engine("duckdb");

import lib.math_utils.Square;
import lib.math_utils.Add;

# Local data
Values(a: 2, b: 3);
Values(a: 4, b: 5);

# Extend imported predicates with local logic
SumOfSquares(a:, b:, result:) :-
  Values(a:, b:),
  Square(a, sq_a),
  Square(b, sq_b),
  Add(sq_a, sq_b, result);

@OrderBy(Test, "a");
Test(a:, b:, result:) :- SumOfSquares(a:, b:, result:);
