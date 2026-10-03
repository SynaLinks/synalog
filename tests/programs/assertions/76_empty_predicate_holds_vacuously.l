# An assertion about an empty predicate has no counterexample.
# Expect: violated E.positive 0
@Assert(E, positive: "∀ x, E x → x > 0");
V(x:) :- x in [1];
E(x:) :- V(x:), x > 5;
