---
name: Total
description: 42
---
# Verifier Test: A number is not a description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/25_numeric_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
