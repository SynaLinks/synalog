# cid's items, all and distinct.
# Expect: rows Q = [(3, 2)]
I(order: 1, customer: "ann", item: "pen", price: 2.5, qty: 3, pos: 1);
I(order: 1, customer: "ann", item: "ink", price: 7.0, qty: 1, pos: 2);
I(order: 2, customer: "ann", item: "pad", price: 4.0, qty: 2, pos: 1);
I(order: 3, customer: "bob", item: "pen", price: 2.5, qty: 10, pos: 1);
I(order: 3, customer: "bob", item: "cap", price: 1.25, qty: 4, pos: 2);
I(order: 3, customer: "bob", item: "ink", price: 7.0, qty: 2, pos: 3);
I(order: 4, customer: "cid", item: "pad", price: 4.0, qty: 1, pos: 1);
I(order: 5, customer: "cid", item: "pen", price: 2.5, qty: 1, pos: 1);
I(order: 5, customer: "cid", item: "pen", price: 2.5, qty: 2, pos: 2);
A(all? List= item, distinct_items? Set= item) distinct :- I(customer: "cid", item:);
Q(n: Size(all), d: Size(distinct_items)) :- A(all:, distinct_items:);
