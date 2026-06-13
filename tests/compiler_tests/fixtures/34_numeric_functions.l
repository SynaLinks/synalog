# Test: Numeric functions

Numbers(x: 4);
Numbers(x: 9);
Numbers(x: 16);
Numbers(x: 25);

# Numeric operations
@OrderBy(Computed, "x");
Computed(x:, sqrt_x: Sqrt(x), abs_neg: Abs(-1 * x), doubled: x * 2) :-
  Numbers(x:);

@OrderBy(Test, "x");
Test(x:, sqrt_x:, abs_neg:, doubled:) :- Computed(x:, sqrt_x:, abs_neg:, doubled:);
