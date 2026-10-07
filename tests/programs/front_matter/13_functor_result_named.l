---
name: Big
description: Revenue of the big customers.
---
# A functor's result can be the named predicate.
# Expect: valid

Segment(c:) :- c in [1, 2, 3];
Large(c:) :- c in [3];
Revenue(n? += 1) distinct :- Segment(c:);
@OrderBy(Big, "n");
Big := Revenue(Segment: Large);
