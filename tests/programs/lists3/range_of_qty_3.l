# A Range per line of order 3: its size is the quantity, its sum the triangle number.
# Expect: rows Q = [(1, 10, 45), (2, 4, 6), (3, 2, 1)]
I(order: 1, customer: "ann", item: "pen", price: 2.5, qty: 3, pos: 1);
I(order: 1, customer: "ann", item: "ink", price: 7.0, qty: 1, pos: 2);
I(order: 2, customer: "ann", item: "pad", price: 4.0, qty: 2, pos: 1);
I(order: 3, customer: "bob", item: "pen", price: 2.5, qty: 10, pos: 1);
I(order: 3, customer: "bob", item: "cap", price: 1.25, qty: 4, pos: 2);
I(order: 3, customer: "bob", item: "ink", price: 7.0, qty: 2, pos: 3);
I(order: 4, customer: "cid", item: "pad", price: 4.0, qty: 1, pos: 1);
I(order: 5, customer: "cid", item: "pen", price: 2.5, qty: 1, pos: 1);
I(order: 5, customer: "cid", item: "pen", price: 2.5, qty: 2, pos: 2);
R(pos:, r: Range(qty)) :- I(order: 3, pos:, qty:);
T(pos:, t? += x) distinct :- R(pos:, r:), x in r;
@OrderBy(Q, "pos", "n", "t");
Q(pos:, n: Size(r), t:) :- R(pos:, r:), T(pos:, t:);
