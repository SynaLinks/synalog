---
description: numbers
---
# Verifier Test: Refused: front matter no name.
# Expected Error: NameError.missingName
#
# (from tests/programs/verifier2/error_front_matter_no_name.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
