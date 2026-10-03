---
name: Total
description: "Totals: one per number."
---
# A description holding ': ' is quoted.
# Expect: valid

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
