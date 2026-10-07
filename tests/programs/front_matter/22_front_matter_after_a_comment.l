# A comment before the front matter: it is not front matter.
---
name: Total
description: Three numbers.
---
# Expect: error Parsing
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
