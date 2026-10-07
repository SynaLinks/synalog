# Orders above their customer's average, counted per customer.
# Expect: rows Q = [('ann', 1), ('bob', 1), ('cid', 1)]
C(c: "ann");
C(c: "bob");
C(c: "cid");
C(c: "dee");
O(id: 1, c: "ann", amt: 30);
O(id: 2, c: "ann", amt: 12);
O(id: 3, c: "bob", amt: 50);
O(id: 4, c: "cid", amt: 7);
O(id: 5, c: "cid", amt: 7);
O(id: 6, c: "cid", amt: 40);
O(id: 7, c: "bob", amt: 5);
@OrderBy(Q, "c");
Q(c:, n? += 1) distinct :- O(c:, amt:), amt > (combine Avg= a :- O(c:, amt: a));
