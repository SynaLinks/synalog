---
name: Total
description: Three numbers.
---
# Test: Windows line endings. (from tests/programs/front_matter/18_crlf_line_endings.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
