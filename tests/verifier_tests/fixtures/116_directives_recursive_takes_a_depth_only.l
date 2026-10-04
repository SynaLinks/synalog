# Verifier Test: @Recursive takes the predicate and its depth, nothing else.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/25_recursive_takes_a_depth_only.l)

@Recursive(R, 3, iterative: true);
E(a: 1, b: 2);
R(x:) distinct :- E(a: x);
R(x: b) distinct :- R(x: a), E(a:, b:);
