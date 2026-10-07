# Test: A page within an @Limit. (from tests/programs/ordering/08_page_with_limit.l)

@OrderBy(O, "x");
@Limit(O, 2);
O(x:) :- x in [40, 10, 30, 20];
