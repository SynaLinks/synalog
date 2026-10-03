---
name: Total
---
# Verifier Test: No description.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/05_no_description.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
