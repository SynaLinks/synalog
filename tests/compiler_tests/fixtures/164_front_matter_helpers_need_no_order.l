---
name: Total
description: Three numbers.
---
# Test: Only the named predicate needs @OrderBy. (from tests/programs/front_matter/12_helpers_need_no_order.l)

Helper(x:) :- x in [1, 2, 3];
@OrderBy(Total, "x");
Total(x:) :- Helper(x:);
