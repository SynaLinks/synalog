---
name: Total
description: Three numbers.
---
# Windows line endings.
# Expect: valid
# Expect: rows Total = [(1,), (2,), (3,)]

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
