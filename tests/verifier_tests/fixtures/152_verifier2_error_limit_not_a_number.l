# Verifier Test: Refused: limit not a number.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/verifier2/error_limit_not_a_number.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Q, "x");
Q(n:) :- N(n:);
