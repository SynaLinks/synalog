---
description: Three numbers.
---
# Verifier Test: No name: which predicate is the file about?
# Expected Error: NameError.missingName
#
# (from tests/programs/front_matter/02_no_name.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
