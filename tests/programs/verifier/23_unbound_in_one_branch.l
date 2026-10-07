# x is bound in one branch of the disjunction only.
# Expect: error Unbound variable 'x'
A(x:) :- x in [1];
B(y:) :- y in [2];
P(x:) :- A(x:) | B(y: x2);
