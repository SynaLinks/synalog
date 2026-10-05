# Test: A boolean column choosing a branch. (from tests/programs/boolean/10_boolean_in_a_conditional.l)

V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
@OrderBy(B, "x");
B(x:, w: (if big then "big" else "small")) :- C(x:, big:);
