# x is bound before it is negated.
# Expect: valid

Item(x:) :- x in [1, 2, 3];
Banned(x: 2);
Allowed(x:) :- Item(x:), ~Banned(x:);
