---
name: Total
description: >
  Three numbers,
  folded on two lines.
---
# Test: A folded YAML description. (from tests/programs/front_matter/20_multiline_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
