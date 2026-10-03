---
name: Total
description: Three numbers.
---
# Test: A complete front matter. (from tests/programs/front_matter/01_name_description_and_order.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
