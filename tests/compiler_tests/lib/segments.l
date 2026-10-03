# A generic rule and its default input, for 56_functor_imported.l.

Customer(customer_id: 1, tier: "enterprise");
Customer(customer_id: 2, tier: "smb");
Order(customer_id: 1, amount: 100);
Order(customer_id: 2, amount: 7);

# The segment: every customer, unless a functor swaps it.
Segment(customer_id:) distinct :- Customer(customer_id:);

SegmentRevenue(revenue? += amount) distinct :-
  Segment(customer_id:), Order(customer_id:, amount:);
