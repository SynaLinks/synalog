---
name: Total
description: Three numbers.
---
# The named predicate must be ordered.
# Expect: error Missing @OrderBy for 'Total'

Total(x:) :- x in [1, 2, 3];
