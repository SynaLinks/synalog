---
name: [Total]
description: Three numbers.
---
# A list is not a name.
# Expect: error The front matter has no name

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
