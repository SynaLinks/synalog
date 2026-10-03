---
name: Total
description: "Totals: one per number."
---
# Test: A description holding ': ' is quoted. (from tests/programs/front_matter/16_quoted_colon_in_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
