# Test: Import with alias

import lib.math_utils.Double as Dbl;
import lib.math_utils.Square as Sqr;

Numbers(x) :- x in [5, 6, 7];

# Use aliased predicates
Results(x:, doubled:, squared:) :-
  Numbers(x),
  Dbl(x, doubled),
  Sqr(x, squared);

@OrderBy(Test, "x");
Test(x:, doubled:, squared:) :- Results(x:, doubled:, squared:);
