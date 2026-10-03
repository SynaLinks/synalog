# Test:  (from tests/programs/front_matter/19_unclosed_front_matter.l)
---
name: Total
description: Three numbers.
# The closing --- is missing.
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
