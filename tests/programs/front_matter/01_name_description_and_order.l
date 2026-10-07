---
name: Total
description: Three numbers.
---
# A complete front matter.
# Expect: valid

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
