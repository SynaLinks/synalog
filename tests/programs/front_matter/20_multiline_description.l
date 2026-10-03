---
name: Total
description: >
  Three numbers,
  folded on two lines.
---
# A folded YAML description.
# Expect: valid
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
