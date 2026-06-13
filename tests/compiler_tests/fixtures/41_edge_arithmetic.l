# Test: Arithmetic edge cases

Numbers(x) :- x in Range(10);

# Division edge cases
DivResults(x, div_by_2, div_by_3) :-
  Numbers(x),
  x > 0,
  div_by_2 == x / 2,
  div_by_3 == x / 3;

# Modulo
ModResults(x, mod_2, mod_3) :-
  Numbers(x),
  mod_2 == x % 2,
  mod_3 == x % 3;

# Power
PowerResults(x, squared, cubed) :-
  Numbers(x),
  x > 0,
  x < 5,
  squared == x ^ 2,
  cubed == x ^ 3;

# Negative numbers
NegativeOps(x, neg, abs_val) :-
  Numbers(x),
  neg == -x,
  abs_val == Abs(x - 5);

# Complex expression precedence
Precedence(x, r1, r2, r3) :-
  Numbers(x),
  x > 0,
  r1 == x + 2 * 3,
  r2 == (x + 2) * 3,
  r3 == x * 2 + 3 * 4;

# Float operations
FloatOps(x, half, third) :-
  Numbers(x),
  x > 0,
  half == x / 2.0,
  third == x / 3.0;

@OrderBy(Test, "x");
Test(x:, squared:, cubed:) :- PowerResults(x, squared, cubed);
