# Verifier Test: Refused: order by sql.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/verifier2/error_order_by_sql.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n; DROP TABLE t");
Q(n:) :- N(n:);
