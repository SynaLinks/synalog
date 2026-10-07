---
name: Big
description: Revenue of the big customers.
---
# Test: A functor's result can be the named predicate. (from tests/programs/front_matter/13_functor_result_named.l)

Segment(c:) :- c in [1, 2, 3];
Large(c:) :- c in [3];
Revenue(n? += 1) distinct :- Segment(c:);
@OrderBy(Big, "n");
Big := Revenue(Segment: Large);
