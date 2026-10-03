---
name: Total
description: Three numbers.
---
# Only the named predicate needs @OrderBy.
# Expect: valid

Helper(x:) :- x in [1, 2, 3];
@OrderBy(Total, "x");
Total(x:) :- Helper(x:);
