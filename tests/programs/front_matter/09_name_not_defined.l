---
name: Nope
description: Three numbers.
---
# The name must be a predicate of the file.
# Expect: error Front matter names 'Nope', which this file does not define

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
