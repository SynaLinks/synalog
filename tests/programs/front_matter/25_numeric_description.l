---
name: Total
description: 42
---
# A number is not a description.
# Expect: error The front matter has no description for 'Total'
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
