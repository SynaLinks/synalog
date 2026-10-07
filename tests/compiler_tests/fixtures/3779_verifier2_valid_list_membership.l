# Test: A program the verifier accepts: list membership. (from tests/programs/verifier2/valid_list_membership.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:), n in [1, 3];
