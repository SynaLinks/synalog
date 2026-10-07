# @OrderBy a predicate that does not exist.
# Expect: error @OrderBy(Nope) is about 'Nope', which the program does not define
@OrderBy(Nope, "x");
V(x:) :- x in [1, 2];
