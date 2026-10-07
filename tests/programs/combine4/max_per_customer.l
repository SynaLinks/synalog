# A combine Max= per customer, null without orders (a count of distinct values, 0).
# Expect: rows Q = [('ann', 30), ('bob', 50), ('cid', 40), ('dee', None)]
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
Q(c:, v: (combine Max= amt :- O(c:, amt:))) :- C(c:);
