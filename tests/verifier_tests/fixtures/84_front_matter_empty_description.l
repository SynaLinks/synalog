---
name: Total
description:
---
# Verifier Test: An empty description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/06_empty_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
