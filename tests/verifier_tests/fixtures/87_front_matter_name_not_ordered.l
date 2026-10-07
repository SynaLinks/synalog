---
name: Total
description: Three numbers.
---
# Verifier Test: The named predicate must be ordered.
# Expected Error: OrderByError.missingOrderBy
#
# (from tests/programs/front_matter/10_name_not_ordered.l)

Total(x:) :- x in [1, 2, 3];
