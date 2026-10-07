# Verifier Test: Refused: recursive depth zero.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/verifier2/error_recursive_depth_zero.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Recursive(Q, 0);
Q(x: 1) distinct;
Q(x: b) distinct :- Q(x: a), E(a:, b:);
