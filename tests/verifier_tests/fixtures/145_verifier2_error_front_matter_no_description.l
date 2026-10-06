---
name: Q
---
# Verifier Test: Refused: front matter no description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/verifier2/error_front_matter_no_description.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:);
