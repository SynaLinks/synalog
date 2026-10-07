# Verifier Test: Refused: limit negative.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/verifier2/error_limit_negative.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Q, -1);
Q(n:) :- N(n:);
