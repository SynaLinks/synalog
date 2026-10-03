---
name: Total
description: Three numbers.
# The closing --- is missing.
# Expect: error front matter
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
