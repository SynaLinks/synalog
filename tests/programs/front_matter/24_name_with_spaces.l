---
name: " Total "
description: Three numbers.
---
# Spaces around the name.
# Expect: valid
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
