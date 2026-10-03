# An assertion on a functor's result.
# Expect: holds BigRevenue.positive

@Assert(BigRevenue, positive: "∀ r, BigRevenue r → r > 0");
Order(customer_id: 1, amount: 50);
Order(customer_id: 2, amount: 500);
Segment(customer_id:) distinct :- Order(customer_id:);
Big(customer_id:) distinct :- Order(customer_id:, amount:), amount > 100;
SegmentRevenue(revenue? += amount) distinct :- Segment(customer_id:), Order(customer_id:, amount:);
BigRevenue := SegmentRevenue(Segment: Big);
