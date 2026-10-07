---
name: Total
description: [a, b]
---
# Verifier Test: A list is not a description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/08_description_is_not_text.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
