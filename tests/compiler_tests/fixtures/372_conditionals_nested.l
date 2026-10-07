# Test: A conditional with several branches. (from tests/programs/conditionals/01_nested.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(C, "x");
C(x:, w: (if x == 1 then "one" else if x == 2 then "two" else "many")) :- V(x:);
