# A Cast type with an unbalanced bracket is refused.
# Expect: error is not a type name
Q(x:) :- x == TryCast(1, "INT)");
