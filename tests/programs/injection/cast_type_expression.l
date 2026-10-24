# A Cast type must be a plain type name, not an expression.
# Expect: error is not a type name
Q(x:) :- x == Cast(1, Upper("text"));
