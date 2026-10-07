---
name: Q
description: the numbers
---
# Test: A program the verifier accepts: front matter complete. (from tests/programs/verifier2/valid_front_matter_complete.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:);
