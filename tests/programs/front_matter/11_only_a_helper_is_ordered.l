---
name: Total
description: Three numbers.
---
# Ordering a helper does not order the named predicate.
# Expect: error Missing @OrderBy for 'Total'

@OrderBy(Helper, "x");
Helper(x:) :- x in [1, 2, 3];
Total(x:) :- Helper(x:);
