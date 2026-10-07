---
name: "   "
description: Three numbers.
---
# A blank name is no name.
# Expect: error The front matter has no name

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
