# Verifier Test: Refused: order by unknown column.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/verifier2/error_order_by_unknown_column.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "zz");
Q(n:) :- N(n:);
