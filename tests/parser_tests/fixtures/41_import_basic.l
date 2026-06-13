# Test: Basic import
@Engine("duckdb");

import lib.math_utils.Double;
import lib.math_utils.Square;

Numbers(x) :- x in [2, 3, 4];

# Use imported predicates
Results(x:, doubled:, squared:) :-
  Numbers(x),
  Double(x, doubled),
  Square(x, squared);

@OrderBy(Test, "x");
Test(x:, doubled:, squared:) :- Results(x:, doubled:, squared:);
