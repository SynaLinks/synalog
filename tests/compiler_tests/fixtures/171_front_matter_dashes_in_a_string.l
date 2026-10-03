---
name: Total
description: "Three numbers --- no more."
---
# Test: --- inside the YAML is not the closing line. (from tests/programs/front_matter/23_dashes_in_a_string.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
