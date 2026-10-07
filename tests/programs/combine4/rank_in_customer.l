# Each order's rank by amount among its customer's (1 the largest).
# Expect: rows Q = [(1, 1), (2, 2), (3, 1), (4, 2), (5, 2), (6, 1), (7, 2)]
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
@OrderBy(Q, "id");
Q(id:, r: 1 + Coalesce((combine += 1 :- O(c:, amt: b), b > amt), 0)) :- O(id:, c:, amt:);
