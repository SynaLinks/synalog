---
# name: Total
---
# Verifier Test: YAML holding only a comment.
# Expected Error: DescriptionError.missingDescription
#
# (from tests/programs/front_matter/27_front_matter_only_comments.l)

Total(x:) :- x in [1, 2, 3];
