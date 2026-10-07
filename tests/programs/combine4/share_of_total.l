# Each order's share of its customer's total.
# Expect: rows Q = [(1, 0.7142857142857143), (2, 0.2857142857142857), (3, 0.9090909090909091), (4, 0.12962962962962962), (5, 0.12962962962962962), (6, 0.7407407407407407), (7, 0.09090909090909091)]
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
Q(id:, s: amt / (combine += a :- O(c:, amt: a))) :- O(id:, c:, amt:);
