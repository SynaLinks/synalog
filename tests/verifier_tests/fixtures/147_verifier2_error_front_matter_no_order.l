---
name: Q
description: numbers
---
# Verifier Test: Refused: front matter no order.
# Expected Error: OrderByError.missingOrderBy
#
# (from tests/programs/verifier2/error_front_matter_no_order.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
