# Test: Built-in functions

# String functions
Strings("hello world", "  padded  ", "MiXeD CaSe");

StringOps(s, len, upper, lower, sub) :-
  Strings(s, _, _),
  len == Length(s),
  upper == Upper(s),
  lower == Lower(s),
  sub == Substr(s, 1, 5);

# Trim operations
TrimOps(s, trimmed, ltrimmed, rtrimmed) :-
  Strings(_, s, _),
  trimmed == Trim(s);

# Math functions
Numbers(x) :- x in [1, 4, 9, 16, 25];

MathOps(x, sqrt_x, floor_x, ceil_x) :-
  Numbers(x),
  sqrt_x == Sqrt(ToFloat64(x)),
  floor_x == Floor(Sqrt(ToFloat64(x))),
  ceil_x == Ceil(Sqrt(ToFloat64(x)));

# Rounding
Decimals(1.4);
Decimals(1.5);
Decimals(1.6);
Decimals(2.5);

RoundOps(d, rounded, floored, ceiled) :-
  Decimals(d),
  rounded == Round(d),
  floored == Floor(d),
  ceiled == Ceil(d);

# Type casting
TypeCast(x, as_str, back_to_int) :-
  Numbers(x),
  as_str == ToString(x),
  back_to_int == ToInt64(as_str);

@OrderBy(Test, "x");
Test(x:, sqrt_x:) :- MathOps(x, sqrt_x, floor_x, ceil_x);
