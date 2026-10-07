---
---
# Verifier Test: An empty front matter block.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/26_empty_front_matter.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];
