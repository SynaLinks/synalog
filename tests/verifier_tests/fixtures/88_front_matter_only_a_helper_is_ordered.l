---
name: Total
description: Three numbers.
---
# Verifier Test: Ordering a helper does not order the named predicate.
# Expected Error: OrderByError.missingOrderBy
#
# (from tests/programs/front_matter/11_only_a_helper_is_ordered.l)

@OrderBy(Helper, "x");
Helper(x:) :- x in [1, 2, 3];
Total(x:) :- Helper(x:);
