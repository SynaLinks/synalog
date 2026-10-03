# An assertion on a functor's result: only the big customer is counted.
# Expect: holds BigRevenue.only_big

@Assert(BigRevenue, only_big: "∀ r, BigRevenue r → r = 500");
Order(customer_id: 1, amount: 50);
Order(customer_id: 2, amount: 500);
Segment(customer_id:) distinct :- Order(customer_id:);
Big(customer_id:) distinct :- Order(customer_id:, amount:), amount > 100;
SegmentRevenue(revenue? += amount) distinct :- Segment(customer_id:), Order(customer_id:, amount:);
BigRevenue := SegmentRevenue(Segment: Big);
