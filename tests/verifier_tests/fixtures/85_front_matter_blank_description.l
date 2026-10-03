---
name: Total
description: "  "
---
# Verifier Test: A blank description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/07_blank_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
