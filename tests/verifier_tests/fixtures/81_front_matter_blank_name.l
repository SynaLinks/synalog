---
name: "   "
description: Three numbers.
---
# Verifier Test: A blank name is no name.
# Expected Error: NameError.missingName
#
# (from tests/programs/front_matter/03_blank_name.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
