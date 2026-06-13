# Test: Built-in functions

Numbers(x) :- x in Range(10), x > 0;

# Math functions
MathOps(x, abs_val, sqrt_val) :-
  Numbers(x),
  abs_val == Abs(x - 5),
  sqrt_val == Sqrt(ToFloat64(x));

# String functions
Strings(s) :- s in ["Hello", "World", "Test"];
StringOps(s, len) :- Strings(s), len == Length(s);

# Array functions
ArrayOps(size, first) :-
  size == Size([1, 2, 3, 4, 5]),
  first == Element([1, 2, 3, 4, 5], 0);

# Join function
Joined() = Join(["a", "b", "c"], "-");

@OrderBy(Test, "col0");
Test(x, abs_val) :- MathOps(x, abs_val, sqrt_val);
