# Each customer's largest share, grouped.
# Expect: rows Q = [('ann', 0.7142857142857143), ('bob', 0.9090909090909091), ('cid', 0.7407407407407407)]
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
Q(c:, s? Max= amt / (combine += a :- O(c:, amt: a))) distinct :- O(c:, amt:);
