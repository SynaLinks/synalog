# Test: @Limit alone still caps the count. (from tests/programs/execution/58_limit_without_order.l)

V(x:) :- x in [1, 2, 3];
@Limit(Two, 2);
Two(x:) :- V(x:);
N(n? += 1) distinct :- Two(x:);
