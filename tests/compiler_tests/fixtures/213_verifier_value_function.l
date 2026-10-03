# Test: A value function: its argument is an input. (from tests/programs/verifier/38_value_function.l)

Inc(x) = n :- n == x + 1;
V(x:) :- x in [1, 2];
@OrderBy(Out, "x");
Out(x:, y:) :- V(x:), y == Inc(x);
