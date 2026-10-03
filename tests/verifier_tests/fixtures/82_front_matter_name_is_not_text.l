---
name: [Total]
description: Three numbers.
---
# Verifier Test: A list is not a name.
# Expected Error: NameError.missingName
#
# (from tests/programs/front_matter/04_name_is_not_text.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
