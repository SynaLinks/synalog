# Test: Ordering a functor's result, by the column it inherits. (from tests/programs/directives/19_order_by_functor_result.l)

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Items(c:) :- All(c:);
@OrderBy(OddItems, "c DESC");
OddItems := Items(All: Odd);
