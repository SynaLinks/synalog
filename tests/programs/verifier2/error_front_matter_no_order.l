---
name: Q
description: numbers
---
# Refused: front matter no order.
# Expect: error Missing @OrderBy for 'Q'
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
