# Test: Boolean operators edge cases

# Data
Numbers(x) :- x in Range(10);

# AND operator (&&)
InRange(x) :- Numbers(x), x > 2 && x < 7;

# OR operator (||)
OutOfRange(x) :- Numbers(x), x < 2 || x > 7;

# NOT operator (!)
NotThree(x) :- Numbers(x), !(x == 3);

# Combined boolean expressions
Complex(x) :- Numbers(x), (x > 5 || x < 2) && !(x == 1);

# Boolean in conditional
Category(x, cat) :-
  Numbers(x),
  cat == (if x > 5 then "high" else "low");

# Nested conditionals with boolean
DetailedCat(x, cat) :-
  Numbers(x),
  cat == (if x > 7 then "very_high"
          else if x > 4 then "high"
          else if x > 1 then "medium"
          else "low");

@OrderBy(Test, "x");
Test(x:, cat:) :- DetailedCat(x, cat);
