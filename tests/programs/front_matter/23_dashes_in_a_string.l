---
name: Total
description: "Three numbers --- no more."
---
# --- inside the YAML is not the closing line.
# Expect: valid
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
