# Test: Multiple imports from different files

import lib.math_utils.Double;
import lib.math_utils.IsPositive;
import lib.data_utils.SampleNumbers;

# Use predicates from multiple imported files
Results(x:, doubled:) :-
  SampleNumbers(x),
  IsPositive(x),
  Double(x, doubled);

@OrderBy(Test, "x");
Test(x:, doubled:) :- Results(x:, doubled:);
